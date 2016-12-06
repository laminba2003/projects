
package org.metamorphosis.core;

import java.io.File;
import java.io.FileReader;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import static java.nio.file.StandardWatchEventKinds.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.digester.Digester;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.Dispatcher;
import org.apache.struts2.dispatcher.DispatcherListener;
import org.apache.tiles.Attribute;
import org.apache.tiles.Definition;
import org.apache.tiles.access.TilesAccess;
import com.opensymphony.xwork2.config.Configuration;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.config.entities.PackageConfig;
import com.opensymphony.xwork2.config.entities.ResultConfig;

public class ModuleManager implements DispatcherListener {

	private List<Module> modules = new ArrayList<Module>();
	private Logger logger = Logger.getLogger(ModuleManager.class.getName());
	private Configuration configuration;
	private ServletContext servletContext;
	private static ModuleManager instance;
	private static final String MODULE_METADATA = "module.xml";
	
	public ModuleManager() {
		instance = this;
	}

	public ModuleManager(ServletContext servletContext) {
		instance = this;
		this.servletContext = servletContext;
	}

	private Module parse(File metadata) throws Exception {
		Digester digester = new Digester();
		digester.setValidating(false);
		digester.addObjectCreate("module", Module.class);
		digester.addBeanPropertySetter("module/name");
		digester.addBeanPropertySetter("module/type");
		digester.addBeanPropertySetter("module/url");
		digester.addBeanPropertySetter("module/icon");
		digester.addBeanPropertySetter("module/index","indexPage");
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
		digester.addObjectCreate("module/menus/menu", Menu.class);
		digester.addSetProperties("module/menus/menu");
		digester.addObjectCreate("module/menus/menu/menuItem", MenuItem.class);
		digester.addSetProperties("module/menus/menu/menuItem");
		digester.addSetNext("module/menus/menu/menuItem", "addMenuItem");
		digester.addSetNext("module/menus/menu", "addMenu");
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

	public void loadModules(final File root) {
		File[] files = root.listFiles();
		if(files != null) {
			for(File folder : files) {
				if(folder.isDirectory()) {
					loadModule(folder);
				}
			}
		}
		orderModules();
		new Thread(new Runnable() {
			public void run() {
				monitorRoot(root);
			}
		}).start();
	}

	public void loadModule(File folder) {
		File metadata = new File(folder + "/"+MODULE_METADATA);
		if(metadata.exists()) {
			try {
				final Module module = parse(metadata);
				module.setFolder(folder);
				module.setId(folder.getName());
				initModule(module);
				addModule(module);
				new Thread(new Runnable() {
					public void run() {
						monitorModule(module);
					}
				}).start();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	private void initModule(Module module) throws Exception {
		if(module.getUrl() == null)
			module.setUrl(module.getFolder().getName());
		for(Menu menu : module.getMenus()) {
			for(MenuItem item : menu.getMenuItems()) {
				String url = item.getUrl() != null ? module.getUrl() + "/" + item.getUrl() : module.getUrl();
				item.setUrl(url);
			}
		}
	}

	private void orderModules() {

	}
	
	@SuppressWarnings("unchecked")
	private void monitorRoot(File root) {
		try {
			WatchService watcher = FileSystems.getDefault().newWatchService();
			Path dir = Paths.get(root.getAbsolutePath());
			dir.register(watcher, ENTRY_CREATE,ENTRY_DELETE);
			while (true) {
				WatchKey key;
				try {
					key = watcher.take();
				} catch (InterruptedException ex) {
					return;
				}
				for (WatchEvent<?> event : key.pollEvents()) {
					WatchEvent.Kind<?> kind = event.kind();
					WatchEvent<Path> ev = (WatchEvent<Path>) event;
					String fileName = ev.context().toString();
					if (kind == OVERFLOW) {
						continue;
					} else if (kind == ENTRY_CREATE) {
						File folder = new File(root+"/"+fileName);
						if(folder.isDirectory()) {
							logger.log(Level.INFO, "adding module  : " + folder.getName());
							final Module module = new Module();
							module.setFolder(folder);
							module.setId(folder.getName());
							initModule(module);
							addModule(module);
							new Thread(new Runnable() {
								public void run() {
									monitorModule(module);
								}
							}).start();
						}
					}else if (kind == ENTRY_DELETE) {
						Module module = getModuleById(fileName);
						if(module!=null) {
							logger.log(Level.INFO, "removing module  : " + module.getName());
							modules.remove(module.getIndex());
							configuration.removePackageConfig(module.getId());
							configuration.rebuildRuntimeConfiguration();
						}
					}
				}
				boolean valid = key.reset();
				if (!valid) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private void monitorModule(Module module) {
		try {
			WatchService watcher = FileSystems.getDefault().newWatchService();
			Path dir = Paths.get(module.getFolder().getAbsolutePath());
			dir.register(watcher, ENTRY_CREATE);
			while (true) {
				WatchKey key;
				try {
					key = watcher.take();
				} catch (InterruptedException ex) {
					return;
				}
				for (WatchEvent<?> event : key.pollEvents()) {
					WatchEvent.Kind<?> kind = event.kind();
					WatchEvent<Path> ev = (WatchEvent<Path>) event;
					String fileName = ev.context().toString();
					if (kind == OVERFLOW) {
						continue;
					} else if (kind == ENTRY_CREATE) {
						if (fileName.equals(MODULE_METADATA)) {
							reloadModule(module);
						}else if (fileName.endsWith(".jsp")) {
							try {
								registerPage(module, fileName);
							}catch(Exception es) {
								
							}
						}
					}
				}
				boolean valid = key.reset();
				if (!valid) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void reloadModule(Module module) {
		try {
			logger.log(Level.INFO, "reloading module  : " + module.getName());
			File folder = module.getFolder();
			int index = module.getIndex();
			String id = module.getId();
			module = parse(new File(folder + "/"+MODULE_METADATA));
			module.setFolder(folder);
			module.setId(folder.getName());
			module.setIndex(index);
			initModule(module);
			modules.set(index, module);
			configuration.removePackageConfig(id);
			PackageConfig.Builder packageBuilder = new PackageConfig.Builder(module.getId());
			packageBuilder.namespace("/" + module.getUrl());
			packageBuilder.addParent(configuration.getPackageConfig("root"));
			for (Menu menu : module.getMenus()) {
				for (MenuItem item : menu.getMenuItems()) {
					if (!item.getUrl().equals(module.getUrl())) {
						String url = item.getUrl().substring(module.getUrl().length() + 1);
						ActionConfig.Builder actionBuilder = new ActionConfig.Builder(url, url, null);
						ResultConfig.Builder resultBuilder = new ResultConfig.Builder("success",
								"org.apache.struts2.views.tiles.TilesResult");
						resultBuilder.addParam("location", item.getUrl());
						actionBuilder.addResultConfig(resultBuilder.build());
						ActionConfig actionConfig = actionBuilder.build();
						packageBuilder.addActionConfig(url, actionConfig);
					}
				}
			}
			for (Action action : module.getActions()) {
				ActionConfig.Builder actionBuilder = new ActionConfig.Builder(action.getUrl(), action.getUrl(),
						action.getClassName());
				actionBuilder.methodName(action.getMethod());
				for (Result result : action.getResults()) {
					if (!result.getValue().equals("") && !result.getValue().startsWith("/")) {
						result.setValue(module.getUrl() + "/" + result.getValue());
					}
					String type = result.getType();
					ResultConfig.Builder resultBuilder = null;
					if (type.equals("tiles")) {
						resultBuilder = new ResultConfig.Builder(result.getName(),
								"org.apache.struts2.views.tiles.TilesResult");
					} else if (type.equals("redirect")) {
						resultBuilder = new ResultConfig.Builder(result.getName(),
								"org.apache.struts2.dispatcher.ServletRedirectResult");
					} else if (type.equals("redirectAction")) {
						resultBuilder = new ResultConfig.Builder(result.getName(),
								"org.apache.struts2.dispatcher.ServletActionRedirectResult");
					} else if (type.equals("dispatcher")) {
						resultBuilder = new ResultConfig.Builder(result.getName(),
								"org.apache.struts2.dispatcher.ServletDispatcherResult");
					}
					if (resultBuilder != null) {
						resultBuilder.addParam("location", result.getValue());
						actionBuilder.addResultConfig(resultBuilder.build());
					}
				}
				ActionConfig actionConfig = actionBuilder.build();
				packageBuilder.addActionConfig(action.getUrl(), actionConfig);
				if(action.getName()!=null && action.isGlobal()) {
					  servletContext.setAttribute(action.getName(),module.getUrl()+"/"+action.getUrl());
				}
			}
			PackageConfig packageConfig = packageBuilder.build();
			configuration.addPackageConfig(module.getId(), packageConfig);
			configuration.rebuildRuntimeConfiguration();
			registerPages(module);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void registerPage(Module module,String file) throws Exception {
		CachingTilesContainer container = (CachingTilesContainer) TilesAccess.getContainer(servletContext);
		TemplateManager templateManager = TemplateManager.getInstance();
		Template template = module.isBackend() ? templateManager.getBackendTemplate(null)
				: templateManager.getFrontendTemplate(null);
		String name = file.substring(0, file.length() - 4);
		Definition definition = new Definition();
		definition.setName(module.getUrl() + "/" + name);
		definition.setExtends(module.getUrl());
		definition.setTemplate(template.getIndexPage());
		definition.setPreparer("org.metamorphosis.core.PagePreparer");
		definition.putAttribute("content", new Attribute("/modules/" + module.getId() + "/" + file));
		container.register(definition);
	}

	private void registerPages(Module module) throws Exception {
		CachingTilesContainer container = (CachingTilesContainer) TilesAccess.getContainer(servletContext);
		TemplateManager templateManager = TemplateManager.getInstance();
		Template template = module.isBackend() ? templateManager.getBackendTemplate(null)
				: templateManager.getFrontendTemplate(null);
		Definition definition = new Definition();
		definition.setName(module.getUrl());
		definition.setExtends(module.getType());
		definition.setTemplate(template.getIndexPage());
		definition.setPreparer("org.metamorphosis.core.PagePreparer");
		definition.putAttribute("content", new Attribute("/modules/" + module.getId() + "/" + module.getIndexPage()));
		container.register(definition);
		for (File file : module.getFolder().listFiles()) {
			if (file.isFile() && file.getName().endsWith(".jsp")) {
				String name = file.getName().substring(0, file.getName().length() - 4);
				definition = new Definition();
				definition.setName(module.getUrl() + "/" + name);
				definition.setExtends(module.getUrl());
				definition.setTemplate(template.getIndexPage());
				definition.setPreparer("org.metamorphosis.core.PagePreparer");
				definition.putAttribute("content", new Attribute("/modules/" + module.getId() + "/" + file.getName()));
				container.register(definition);
			}
		}
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
		for(Module module : modules) {
			if(module.getUrl().equals(url) || ("/" + module.getUrl()).equals(url)) return module;
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
		module.setIndex(modules.size());
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
			if(module.isVisible() && module.getType().equals(type)) modules.add(module);
		}
		return modules;
	}

	public Module getDefaultBackendModule() {
		for(Module module : this.modules) {
			if(module.isBackend()) return module;
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
		for(Module module : modules) {
			if(module.isMain()) return module;
		}
		return getDefaultBackendModule();
	}

	public Configuration getConfiguration() {
		return configuration;
	}

	public void setConfiguration(Configuration configuration) {
		this.configuration = configuration;
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	@Override
	public void dispatcherInitialized(Dispatcher dispatcher) {
		configuration = dispatcher.getConfigurationManager().getConfiguration();
	}
	
	@Override
	public void dispatcherDestroyed(Dispatcher dispatcher) {
	}

	public static ModuleManager getInstance() {
		return instance;
	}
	
}