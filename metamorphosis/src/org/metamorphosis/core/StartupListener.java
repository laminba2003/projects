package org.metamorphosis.core;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.EnumSet;
import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
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
		event.getServletContext().setAttribute("path",event.getServletContext().getContextPath()+"/");
		String root = new File(event.getServletContext().getRealPath(File.separator)).getAbsolutePath();
		ModuleManager moduleManager = loadModules(root);
		event.getServletContext().setAttribute("moduleManager",moduleManager);
		TemplateManager templateManager = loadTemplates(root);
		event.getServletContext().setAttribute("templateManager",templateManager);
		String id = event.getServletContext().getInitParameter("template");
		Template template = templateManager.getSelectedTemplate(id);
		event.getServletContext().setAttribute("template",template.getId());
		String tilesDefinitions = "/WEB-INF/tiles.xml,"+createTemplateTiles(root,template.getId());
		String config = "struts-default.xml,struts-plugin.xml,struts.xml";
		for(Module module : moduleManager.getModules()) {
			File definition = new File(module.getFolder().getAbsolutePath()+File.separator+"tiles.xml");
			if(definition.exists()) {
				tilesDefinitions += ","+"/modules/"+module.getFolder().getName()+"/tiles.xml";
			}else {
				tilesDefinitions += ","+createModuleTiles(module);
			}
			definition = new File(module.getFolder().getAbsolutePath()+File.separator+"struts.xml");
			if(definition.exists()) {
				config += ","+definition.getAbsolutePath();
			}else {
				if(module.getActions().size()>0) {
					config += ","+createModuleConfig(module);
				}
			}
		}
		FilterRegistration struts2 = event.getServletContext().addFilter("struts2", org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter.class);
		struts2.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST),true, "/*");
		struts2.setInitParameter("config",config);
		event.getServletContext().setInitParameter("org.apache.tiles.impl.BasicTilesContainer.DEFINITIONS_CONFIG",tilesDefinitions);
		TilesListener listener = new TilesListener();
		listener.contextInitialized(event);
		copyFiles(root);
	}

	private TemplateManager loadTemplates(String root) {
		TemplateManager manager = new TemplateManager();
		manager.loadTemplates(new File(root+File.separator+"templates"));
		return manager;
	}

	private ModuleManager loadModules(String root) {
		ModuleManager manager = new ModuleManager();
		manager.loadModules(new File(root+File.separator+"modules"));
		return manager;
	}

	private String createTemplateTiles(String root,String template) {
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
				"<!DOCTYPE tiles-definitions PUBLIC '-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN' "+
				"'http://tiles.apache.org/dtds/tiles-config_2_0.dtd'>"+
				"<tiles-definitions><definition name='template' template='/templates/"+template+"/index.jsp' preparer='org.metamorphosis.core.PagePreparer'/>"+
				"</tiles-definitions>";
		File temp=null;
		try {
			temp = new File(root+File.separator+"templates"+File.separator+"tiles.xml");
			BufferedWriter bw = new BufferedWriter(new FileWriter(temp));
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/templates/"+temp.getName();
	}

	private String createModuleTiles(Module module) {
		String template = module.getTemplate()!=null ? module.getTemplate() : "template";
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
				"<!DOCTYPE tiles-definitions PUBLIC '-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN' "+
				"'http://tiles.apache.org/dtds/tiles-config_2_0.dtd'>"+
				"<tiles-definitions><definition name='"+module.getUrl()+"' extends='"+template+"'>"+
				"<put-attribute name='content' value='/modules/"+module.getId()+"/"+module.getHome()+"'/>"+
				"</definition>";
		if(module.getTemplate()!=null) {
			content+="<definition name='"+module.getTemplate()+"' template='/template.jsp'/>";
		}
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
	
	private void copyFiles(String root) {
		copyFiles(root,"css","metamorphosis.css");
		copyFiles(root,"js","metamorphosis.js");
		copyFiles(root,"js","pdfmake.min.js");
		copyFiles(root,"js","vfs_fonts.js");
	}
	
	private void copyFiles(String root,String dir,String file)	{
		InputStream source = this.getClass().getClassLoader().getResourceAsStream("META-INF/"+file);
		if(source!=null) {
			try {
			 File folder = new File(root+File.separator+dir);
			 folder.mkdirs();
			 copyFile(source,new File(folder+File.separator+file));
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	private void copyFile(InputStream source,File destination) throws Exception {
		 BufferedReader br = new BufferedReader(new InputStreamReader(source));
		 BufferedWriter bw = new BufferedWriter(new FileWriter(destination));
		 String content;
			while ((content = br.readLine()) != null) {
				bw.write(content+"\n");
			}
			br.close();
			bw.close();
	}

}