package core;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StartupListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		event.getServletContext().setAttribute("path",event.getServletContext().getContextPath());
		String tilesDefinitions = "/WEB-INF/tiles.xml";
		String config = "struts-default.xml,struts-plugin.xml,struts.xml";
		String root = new File(event.getServletContext().getRealPath(File.separator)).getAbsolutePath();
		File directory = new File(root+File.separator+"modules");
		for(File file : directory.listFiles()) {
			if(file.isDirectory()) {
				File definition = new File(file.getAbsolutePath()+File.separator+"tiles.xml");
				if(definition.exists()) {
					tilesDefinitions += ","+"/modules/"+file.getName()+"/tiles.xml";
				}
				definition = new File(file.getAbsolutePath()+File.separator+"struts.xml");
				if(definition.exists()) {
					config += ","+definition.getAbsolutePath();
				}
			}
		}
		event.getServletContext().getFilterRegistration("struts2").setInitParameter("config",config);
		event.getServletContext().setInitParameter("org.apache.tiles.impl.BasicTilesContainer.DEFINITIONS_CONFIG",tilesDefinitions);
		event.getServletContext().setAttribute("counter", 0);
	}
}
