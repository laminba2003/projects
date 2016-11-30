
package org.metamorphosis.core;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.digester.Digester;
import org.apache.struts2.ServletActionContext;

public class ModuleManager {

	private List<Module> modules = new ArrayList<Module>();

	private Module parse(File metadata) throws Exception {
		Digester digester = new Digester();
		digester.setValidating(false);
		digester.addObjectCreate("module", Module.class);
		digester.addBeanPropertySetter("module/name");
		digester.addBeanPropertySetter("module/type");
		digester.addBeanPropertySetter("module/url");
		digester.addBeanPropertySetter("module/home");
		digester.addBeanPropertySetter("module/script");
		digester.addBeanPropertySetter("module/template");
		digester.addBeanPropertySetter("module/main");
		digester.addBeanPropertySetter("module/visible");
		digester.addBeanPropertySetter("module/administrable");
		digester.addBeanPropertySetter("module/order");
		digester.addBeanPropertySetter("module/author");
		digester.addBeanPropertySetter("module/authorEmail");
		digester.addBeanPropertySetter("module/authorUrl");
		digester.addBeanPropertySetter("module/description");
		digester.addBeanPropertySetter("module/creationDate");
		digester.addBeanPropertySetter("module/copyright");
		digester.addBeanPropertySetter("module/license");
		digester.addBeanPropertySetter("module/version");
		digester.addObjectCreate("module/menu", Menu.class);
		digester.addObjectCreate("module/menu/menuItem", MenuItem.class);
		digester.addSetProperties("module/menu/menuItem");
		digester.addSetNext("module/menu/menuItem", "addMenuItem");
		digester.addSetNext("module/menu", "setMenu");
		digester.addObjectCreate("module/actions/action", Action.class);
		digester.addSetProperties("module/actions/action");
		digester.addSetProperties("module/actions/action", "class", "className");
		digester.addObjectCreate("module/actions/action/result", Result.class);
		digester.addSetProperties("module/actions/action/result");
		digester.addSetNext("module/actions/action/result", "addResult");
		digester.addCallMethod("module/actions/action/result", "setValue", 0);
		digester.addSetNext("module/actions/action", "addAction");
		return (Module) digester.parse(metadata);
	}

	public void loadModules(File root) {
		File[] files = root.listFiles();
		if (files != null) {
			for (File folder : files) {
				if (folder.isDirectory()) {
					File metadata = new File(folder + "/module.xml");
					if (metadata.exists()) {
						try {
							Module module = parse(metadata);
							module.setFolder(folder);
							module.setId(folder.getName());
							initModule(module);
							addModule(module);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		orderModules();
	}

	private void initModule(Module module) throws Exception {
		if (module.getUrl() == null)
			module.setUrl(module.getFolder().getName().toLowerCase());
		if (module.getMenu() != null) {
			for (MenuItem item : module.getMenu().getMenuItems()) {
				if (item.getAction() != null) {
					item.setAction(module.getUrl() + "/" + item.getAction());
				} else {
					item.setAction(module.getUrl());
				}
			}
		}
		File script = new File(module.getFolder() + "/scripts/init.groovy");
		script = script.exists() ? script : new File(module.getFolder() + "/scripts/" + module.getScript());
		if (script.exists()) {
			String name = script.getName();
			String extension = name.substring(name.indexOf(".") + 1);
			ScriptEngine engine = new ScriptEngineManager().getEngineByExtension(extension);
			engine.eval(new FileReader(script));
		}
	}

	private void orderModules() {

	}

	public Module getCurrentModule() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String uri = request.getRequestURI();
		String url = uri.substring(request.getContextPath().length() + 1, uri.length());
		url = url.indexOf("/") != -1 ? url.substring(0, url.indexOf("/")) : url;
		Module module = getModuleByUrl(url);
		return module != null ? module : getModuleByUrl("/");
	}

	public Module getModuleByUrl(String url) {
		for (Module module : modules) {
			if (module.getUrl().equals(url) || ("/" + module.getUrl()).equals(url))
				return module;
		}
		return null;
	}

	public Object buildAction(String url) throws Exception {
		Module module = getCurrentModule();
		if (module != null) {
			Action action = module.getAction(url);
			if (action != null && action.getScript() != null) {
				File script = new File(module.getFolder() + "/scripts/" + action.getScript());
				if (script.exists()) {
					String name = script.getName();
					String extension = name.substring(name.indexOf(".") + 1);
					ScriptEngine engine = new ScriptEngineManager().getEngineByExtension(extension);
					return engine.eval(new FileReader(script));
				}
			}

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
			if(module.isVisible() && module.getType().equals(type))
				modules.add(module);
		}
		return modules;
	}

	public Module getDefaultBackendModule() {
		for(Module module : this.modules) {
			if(module.isBackend())return module;
		}
		return null;
	}

	public List<Module> getAdminModules() {
		List<Module> modules = new ArrayList<Module>();
		for(Module module : this.modules) {
			if(module.isAdministrable()) modules.add(module);
		}
		return modules;
	}

	public Module getMain() {
		for(Module module : this.modules) {
			if (module.isMain()) return module;
		}
		return getDefaultBackendModule();
	}
	
	public void signIn() throws IOException {
		Module module = getMain();
		HttpServletRequest request = ServletActionContext.getRequest();
		String url = module!=null ? request.getContextPath()+"/"+module.getUrl() : request.getContextPath()+"/";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.sendRedirect(url);
	}

}