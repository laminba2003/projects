
package org.metamorphosis.core;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.EnumSet;
import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.struts2.dispatcher.Dispatcher;
import org.apache.tiles.web.startup.TilesListener;

@WebListener
public class StartupListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		context.setAttribute("path",context.getContextPath()+"/");
		String root = new File(context.getRealPath("/")).getAbsolutePath();
		FilterRegistration struts2 = context.addFilter("struts2", org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter.class);
		struts2.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST,DispatcherType.FORWARD),true, "/*");
		StringBuffer buffer = new StringBuffer(loadTemplates(context, root));
		struts2.setInitParameter("config",loadModules(context, root, buffer));
		context.setInitParameter("org.apache.tiles.factory.TilesContainerFactory","org.metamorphosis.core.TilesContainerFactory");
		context.setInitParameter("org.apache.tiles.impl.BasicTilesContainer.DEFINITIONS_CONFIG",buffer.toString());
		new TilesListener().contextInitialized(event);
		copyFiles(root);
		
	}
	
	private String loadTemplates(ServletContext context,String root) {
		TemplateManager templateManager = new TemplateManager();
		templateManager.loadTemplates(new File(root+"/templates"));
		context.setAttribute("templateManager",templateManager);
		Template template = templateManager.getBackendTemplate(null);
		if(template==null) {
			copyBackendTemplate(root);
			template = templateManager.loadTemplate(new File(root+"/templates/nova"));
		}
		context.setAttribute("template",template.getId());
		String tilesDefinitions = createTemplateTiles(root,template);
		template = templateManager.getFrontendTemplate(null);
		if(template==null) {
			copyFrontendTemplate(root);
			template = templateManager.loadTemplate(new File(root+"/templates/medusa"));
		}
		return tilesDefinitions += ","+ createTemplateTiles(root,template);
	}
	
	private String loadModules(ServletContext context,String root,StringBuffer buffer) {
		String config = "struts-default.xml,struts-plugin.xml,struts.xml";
		ModuleManager moduleManager = new ModuleManager(context);
		moduleManager.loadModules(new File(root+"/modules"));
		context.setAttribute("moduleManager",moduleManager);
		Dispatcher.addDispatcherListener(moduleManager);
		for(Module module : moduleManager.getModules()) {
			buffer.append(","+createModuleTiles(module));
			config +=","+createModuleConfig(module);
			for(Action action : module.getActions()) {
				if(action.getName()!=null && action.isGlobal())
				context.setAttribute(action.getName(),module.getUrl()+"/"+action.getUrl());
			}
			if(module.getId().equals("users")) {
				context.setAttribute("security",true);
			}
		}
		return config;
	}

	private String createTemplateTiles(String root,Template template) {
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
				"<!DOCTYPE tiles-definitions PUBLIC '-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN' "+
				"'http://tiles.apache.org/dtds/tiles-config_2_0.dtd'>"+
				"<tiles-definitions><definition name='"+template.getType()+"' template='"+template.getIndexPage()+"' preparer='org.metamorphosis.core.PagePreparer'/>";
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
			temp = new File(root+"/templates"+"/tiles-"+template.getType()+".xml");
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
				"<put-attribute name='content' value='/modules/"+module.getId()+"/"+module.getIndexPage()+"'/>"+
				"</definition>";
		for(File file : module.getFolder().listFiles()) {
			if(file.isFile() && file.getName().endsWith(".jsp")) {
				String name = file.getName().substring(0,file.getName().length()-4);
				content+="<definition name='"+module.getUrl()+"/"+name+"' extends='"+module.getUrl()+"'>";
				content+="<put-attribute name='content' value='/modules/"+module.getId()+"/"+file.getName()+"'/>";
				content+="</definition>";
			}
		}
		content +="</tiles-definitions>";
		File temp=null;
		try {
			temp = new File(module.getFolder()+"/tiles-generated.xml");
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
		for(Menu menu : module.getMenus()) {
			for(MenuItem item : menu.getMenuItems()) {
				if(!item.getUrl().equals(module.getUrl())) {
					String url = item.getUrl().substring(module.getUrl().length()+1);
					content+="<action name='"+url+"'>";
					content+="<result name='success' type='tiles'>"+item.getUrl()+"</result>";
					content+="</action>";
				}
			}
		}
		for(Action action : module.getActions()) {
			content+="<action name='"+action.getUrl()+"' class='"+action.getClassName()+"' method='"+action.getMethod()+"'>";
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
			temp = new File(module.getFolder()+"/struts-generated.xml");
			BufferedWriter bw = new BufferedWriter(new FileWriter(temp));
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return temp.getAbsolutePath();
	}
	
	private void copyFiles(String root) {
		if(!new File(root+"/css/metamorphosis.css").exists()) {
		  copyFile(root,"css","metamorphosis.css");
		}
		if(!new File(root+"/js/metamorphosis.js").exists()) {
		  copyFile(root,"js","metamorphosis.js");
		}
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
			 File folder = new File(root+"/"+dir);
			 folder.mkdirs();
			 File dest = new File(folder+"/"+file);
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

	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

}