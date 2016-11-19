
package org.metamorphosis.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ModuleManager {

	private List<Module> modules = new ArrayList<Module>();
	private Module main;

	public void loadModules(File root) {
		ModuleLoader loader = new ModuleLoader();
		File[] files = root.listFiles();
		if(files!=null) {
		for(File file : files) {
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
									if(item.getPage()==null) {
										item.setPage(item.getAction()+".jsp");
									}
									if(module.getUrl().equals("/")) {
										 item.setAction(item.getAction());
									} else {
									 item.setAction(module.getUrl()+"/"+item.getAction());
									}
								}else {
									item.setAction(module.getUrl());
									item.setTitle(module.getUrl());
									if(item.getPage()==null) {
										item.setPage(module.getHome());
									}
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
	
	public Module getModuleById(String id) {
		for(Module module : modules) {
			if(module.getId().equals(id)) return module;
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

	public List<Module> getVisibleModules(String type) {
		List<Module> modules = new ArrayList<Module>();
		for(Module module : this.modules) {
			if(module.isVisible() && module.getType().equals(type))modules.add(module);
		}
		return modules;
	}

	public Module getDefaultBackendModule() {
		for(Module module : this.modules) {
			if(module.getType().equals("back-end")) return module;
		}
		return null;
	}
	public List<Module> getAdminModules() {
		List<Module> modules = new ArrayList<Module>();
		for(Module module : this.modules) {
			if(module.isAdministrable())modules.add(module);
		}
		return modules;
	}

	public Module getMain() {
		return main;
	}

	public void setMain(Module main) {
		this.main = main;
	}

}