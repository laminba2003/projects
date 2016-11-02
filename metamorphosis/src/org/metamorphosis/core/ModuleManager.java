package org.metamorphosis.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ModuleManager {

	private List<Module> modules = new ArrayList<Module>();
	private Module main;

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
				    if(module.getMenu()!=null) {
					    for(MenuItem item : module.getMenu().getMenuItems()) {
							if(item.getAction()!=null) {
								item.setAction(module.getUrl()+"/"+item.getAction());
								if(item.getTitle()==null) item.setTitle(module.getUrl()+"/"+item.getName());
							}else {
								item.setAction(module.getUrl());
								item.setTitle(module.getUrl());
							}
						}
				    }
				    if(module.isMain()) main = module;
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
	
	public Module getModuleByUrl(String url) {
		
		for(Module module : modules) {
			if(module.getUrl().equals(url)) return module;
		}
		return null;
		
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

	public Module getMain() {
		return main;
	}

	public void setMain(Module main) {
		this.main = main;
	}
	
}