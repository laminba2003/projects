package org.metamorphosis.core;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.EnumSet;
import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

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
		String template = event.getServletContext().getInitParameter("template");
		template = template !=null ? template : templateManager.getTemplates().get(0).getId();
		event.getServletContext().setAttribute("template",template);
		String tilesDefinitions = "/WEB-INF/tiles.xml,"+createTemplateTiles(root,template);
		String config = "struts-default.xml,struts-plugin.xml,struts.xml";
		for(Module module : moduleManager.getModules()) {
			File definition = new File(module.getFolder().getAbsolutePath()+File.separator+"tiles.xml");
			if(definition.exists()) {
				tilesDefinitions += ","+"/modules/"+module.getFolder().getName()+"/tiles.xml";
			}else {
				tilesDefinitions += ","+createModuleTiles(root,module);
			}
			definition = new File(module.getFolder().getAbsolutePath()+File.separator+"struts.xml");
			if(definition.exists()) {
				config += ","+definition.getAbsolutePath();
			}
		}
		FilterRegistration struts2 = event.getServletContext().addFilter("struts2", org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter.class);
		struts2.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST),true, "/*");
		struts2.setInitParameter("config",config);
		event.getServletContext().setInitParameter("org.apache.tiles.impl.BasicTilesContainer.DEFINITIONS_CONFIG",tilesDefinitions);
	}
	
	public TemplateManager loadTemplates(String root) {
		TemplateManager manager = new TemplateManager();
		manager.loadTemplates(new File(root+File.separator+"templates"));
		return manager;
	}
	
	public ModuleManager loadModules(String root) {
		ModuleManager manager = new ModuleManager();
		manager.loadModules(new File(root+File.separator+"modules"));
		return manager;
	}
	
	public String createTemplateTiles(String root,String template) {
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
	
	public String createModuleTiles(String root,Module module) {
		String content = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"+
		"<!DOCTYPE tiles-definitions PUBLIC '-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN' "+
		 "'http://tiles.apache.org/dtds/tiles-config_2_0.dtd'>"+
         "<tiles-definitions><definition name='"+module.getId()+"' extends='template'>"+
         "<put-attribute name='content' value='/modules/"+module.getId()+"/index.jsp'/>"+
         "</definition>";
		if(module.getMenu()!=null) {
		    for(MenuItem item : module.getMenu().getMenuItems()) {
		    	content+="<definition name='"+item.getAction()+"' extends='template'>";
		    	content+="<put-attribute name='content' value='/modules/"+module.getId()+"/"+item.getPage()+"'/>";
		    	content+="</definition>";
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
	
}
