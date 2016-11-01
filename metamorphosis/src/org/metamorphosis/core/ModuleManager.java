package org.metamorphosis.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ModuleManager {

	private List<Module> modules = new ArrayList<Module>();

	public void loadModules(File root) {
		ModuleLoader loader = new ModuleLoader();
		for(File file : root.listFiles()) {
			if(file.isDirectory()) {
			   File metadata = new File(file+File.separator+"module.xml");
			   if(metadata.exists()) {
				   try {
				    Module module = loader.loadModule(metadata);
				    module.setFolder(file);
				    module.setId(file.getName());
				    if(module.getUrl()==null) module.setUrl(file.getName().toLowerCase());
				    addModule(module);
				   }catch(Exception e){
					   e.printStackTrace();
				   }
			   }
			}
		}
		orderModules();
	}
	
	private void orderModules() {
	
	}
	
	public void addModule(Module module) {
		modules.add(module);
	}

	public List<Module> getModules() {
		return modules;
	}
	
	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	
}