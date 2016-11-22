package org.metamorphosis.core;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.EnumSet;
import javax.script.Compilable;
import javax.script.CompiledScript;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.tiles.web.startup.TilesListener;

@WebListener
public class StartupListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		context.setAttribute("path",context.getContextPath()+"/");
		String root = new File(context.getRealPath(File.separator)).getAbsolutePath();
		TemplateManager templateManager = new TemplateManager();
		templateManager.loadTemplates(new File(root+File.separator+"templates"));
		context.setAttribute("templateManager",templateManager);
		Template template = templateManager.getBackendTemplate(context.getInitParameter("back-end"));
		if(template==null) {
			copyBackendTemplate(root);
			template = templateManager.loadTemplate(new File(root+File.separator+"templates/nova"));
		}
		context.setAttribute("template",template.getId());
		String tilesDefinitions = createTemplateTiles(root,template);
		template = templateManager.getFrontendTemplate(context.getInitParameter("front-end"));
		if(template==null) {
			copyFrontendTemplate(root);
			template = templateManager.loadTemplate(new File(root+File.separator+"templates/medusa"));
		}
		tilesDefinitions += ","+ createTemplateTiles(root,template);
		String config = "struts-default.xml,struts-plugin.xml,struts.xml";
		ModuleManager moduleManager = new ModuleManager();
		moduleManager.loadModules(new File(root+File.separator+"modules"));
		context.setAttribute("moduleManager",moduleManager);
		for(Module module : moduleManager.getModules()) {
			File definition = new File(module.getFolder()+File.separator+"tiles.xml");
			if(definition.exists()) {
				tilesDefinitions += ","+"/modules/"+module.getFolder().getName()+"/tiles.xml";
			}else {
				tilesDefinitions += ","+createModuleTiles(module);
			}
			definition = new File(module.getFolder()+File.separator+"struts.xml");
			if(definition.exists()) {
				config += ","+definition;
			}else {
				if(module.getActions().size()>0) {
					config += ","+createModuleConfig(module);
				}
			}
			if(module.getId().equals("users")) {
				context.setAttribute("security",true);
			}
			compileScripts(module,context);
		}
		FilterRegistration struts2 = context.addFilter("struts2", org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter.class);
		struts2.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST,DispatcherType.FORWARD),true, "/*");
		struts2.setInitParameter("config",config);
		context.setInitParameter("org.apache.tiles.impl.BasicTilesContainer.DEFINITIONS_CONFIG",tilesDefinitions);
		new TilesListener().contextInitialized(event);
		copyFiles(root);
	}

	private String createTemplateTiles(String root,Template template) {
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
				"<!DOCTYPE tiles-definitions PUBLIC '-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN' "+
				"'http://tiles.apache.org/dtds/tiles-config_2_0.dtd'>"+
				"<tiles-definitions><definition name='"+template.getType()+"' template='/templates/"+template.getId()+"/index.jsp' preparer='org.metamorphosis.core.PagePreparer'/>";
		if(template.isFrontend()) {
			content += "<definition name='index' extends='"+template.getType()+"'>";
			content+="<put-attribute name='content' value='/index.jsp'/>";
			content+="</definition>";
			if(!new File(root+"/index.jsp").exists()) {
				copyFile(root,"","index.jsp");
			}
		}
		content +="</tiles-definitions>";
		File temp=null;
		try {
			temp = new File(root+File.separator+"templates"+File.separator+"tiles-"+template.getType()+".xml");
			BufferedWriter bw = new BufferedWriter(new FileWriter(temp));
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/templates/"+temp.getName();
	}

	private String createModuleTiles(Module module) {
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
				"<!DOCTYPE tiles-definitions PUBLIC '-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN' "+
				"'http://tiles.apache.org/dtds/tiles-config_2_0.dtd'>"+
				"<tiles-definitions><definition name='"+module.getUrl()+"' extends='"+module.getType()+"'>"+
				"<put-attribute name='content' value='/modules/"+module.getId()+"/"+module.getHome()+"'/>"+
				"</definition>";
		if(module.getMenu()!=null) {
			for(MenuItem item : module.getMenu().getMenuItems()) {
					if(!module.getUrl().equals(item.getAction())) {
					content+="<definition name='"+item.getAction()+"' extends='"+module.getUrl()+"'>";
					content+="<put-attribute name='content' value='/modules/"+module.getId()+"/"+item.getPage()+"'/>";
					content+="</definition>";
				}
			}
		}else {
			for(File file : module.getFolder().listFiles()) {
				if(file.isFile() && file.getName().endsWith(".jsp")) {
					String name = file.getName().substring(0,file.getName().length()-4);
					content+="<definition name='"+module.getUrl()+"/"+name+"' extends='"+module.getUrl()+"'>";
					content+="<put-attribute name='content' value='/modules/"+module.getId()+"/"+file.getName()+"'/>";
					content+="</definition>";
				}
			}
		}
		content +="</tiles-definitions>";
		File temp=null;
		try {
			temp = new File(module.getFolder()+File.separator+"tiles-generated.xml");
			BufferedWriter bw = new BufferedWriter(new FileWriter(temp));
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/modules/"+module.getId()+"/"+temp.getName();
	}

	private String createModuleConfig(Module module) {
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
				"<!DOCTYPE struts PUBLIC '-//Apache Software Foundation//DTD Struts Configuration 2.0//EN' "+
				"'http://struts.apache.org/dtds/struts-2.0.dtd'>"+
				"<struts><package name='"+module.getId()+"' namespace='/"+module.getUrl()+"' extends='root'>";
		if(module.getMenu()!=null) {
			for(MenuItem item : module.getMenu().getMenuItems()) {
				if(item.getAction().equals(module.getUrl())) {
					content+="<action name='"+item.getAction()+"'>";
					content+="<result name='success' type='tiles'>"+module.getUrl();
					content+="</result>";
					content+="</action>";
				}else {
					String name = item.getAction().substring(module.getUrl().length()+1);
					content+="<action name='"+name+"'>";
					content+="<result name='success' type='tiles'>"+item.getAction();
					content+="</result>";
					content+="</action>";
				}
			}
		}
		for(Action action : module.getActions()) {
			content+="<action name='"+action.getName()+"' class='"+action.getClassName()+"' method='"+action.getMethod()+"'>";
			for(Result result : action.getResults()) {
				if(!result.getValue().equals("") && !result.getValue().startsWith("/")) {
					result.setValue(module.getUrl()+"/"+result.getValue());
				}
				content+="<result name='"+result.getName()+"' type='"+result.getType()+"'>"+result.getValue();
				content+="</result>";
			}
			content+="</action>";
		}
		content +="</package></struts>";
		File temp=null;
		try {
			temp = new File(module.getFolder()+File.separator+"struts-generated.xml");
			BufferedWriter bw = new BufferedWriter(new FileWriter(temp));
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return temp.getAbsolutePath();
	}
	
	private void compileScripts(Module module,ServletContext context) {
		File folder = new File(module.getFolder()+"/scripts");
		if(folder.exists()) {
			ScriptEngineManager manager = new ScriptEngineManager();
			File[] files = folder.listFiles();
			if(files!=null) {
				for(File file : files) {
					String name = file.getName();
					String extension = file.getName().substring(name.indexOf(".")+1);
					ScriptEngine engine = manager.getEngineByExtension(extension);
					engine.put("servletContext", context);
					if(engine instanceof Compilable) {
						Compilable compilable = (Compilable) engine;
						try {
							CompiledScript script = compilable.compile(new FileReader(file));
							script.eval();
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	private void copyFiles(String root) {
		copyFile(root,"css","metamorphosis.css");
		copyFile(root,"js","metamorphosis.js");
		copyFile(root,"js","pdfmake.min.js");
		copyFile(root,"js","vfs_fonts.js");
		if(!new File(root+"/images/logo.png").exists()) {
			copyFile(root,"images","logo.png");
		}
		if(!new File(root+"/images/favicon.ico").exists()) {
			copyFile(root,"images","favicon.ico");
		}
	}
	
	private void copyBackendTemplate(String root) {
		copyFile(root,"templates","nova/index.jsp");
		copyFile(root,"templates","nova/template.xml");
		copyFile(root,"templates","nova/thumbnail.png");
		copyFile(root,"templates","nova/css/template.css");
		copyFile(root,"templates","nova/js/jquery.magnific-popup.min.js");
		copyFile(root,"templates","nova/js/jquery.smartWizard.js");
		copyFile(root,"templates","nova/js/template.js");
		copyFile(root,"templates","nova/images/account-16.png");
		copyFile(root,"templates","nova/images/delete-16.png");
		copyFile(root,"templates","nova/images/edit-16.png");
		copyFile(root,"templates","nova/images/new-16.png");
		copyFile(root,"templates","nova/images/pdf-16.png");
		copyFile(root,"templates","nova/images/print-16.png");
		copyFile(root,"templates","nova/images/search.png");
		copyFile(root,"templates","nova/images/signout.png");
		copyFile(root,"templates","nova/images/square.png");
		copyFile(root,"templates","nova/images/wait.gif");
	}
	
	private void copyFrontendTemplate(String root) {
		copyFile(root,"templates","medusa/index.jsp");
		copyFile(root,"templates","medusa/template.xml");
		copyFile(root,"templates","medusa/thumbnail.png");
		copyFile(root,"templates","medusa/css/template.css");
	}
	
	private void copyFile(String root,String dir,String file)	{
		InputStream source = this.getClass().getClassLoader().getResourceAsStream("META-INF/"+file);
		if(source!=null) {
			try {
			 File folder = new File(root+File.separator+dir);
			 folder.mkdirs();
			 File dest = new File(folder+File.separator+file);
			 dest.getParentFile().mkdirs();
			 copyFile(source,dest);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	private void copyFile(InputStream source,File destination) throws Exception {
		 BufferedInputStream br = new BufferedInputStream(source);
		 BufferedOutputStream bw = new BufferedOutputStream(new FileOutputStream(destination));
		 byte[] buffer = new byte[1024];
	        int length;
	        while ((length = br.read(buffer)) > 0) {
	            bw.write(buffer, 0, length);
	        }
		br.close();
		bw.close();
	}

}