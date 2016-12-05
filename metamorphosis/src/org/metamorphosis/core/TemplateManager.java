package org.metamorphosis.core;

import static java.nio.file.StandardWatchEventKinds.ENTRY_CREATE;
import static java.nio.file.StandardWatchEventKinds.OVERFLOW;
import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.digester.Digester;

public class TemplateManager {

	private List<Template> templates = new ArrayList<Template>();
	private Logger logger = Logger.getLogger(TemplateManager.class.getName());
	
	private static TemplateManager instance;

	public TemplateManager() {
		instance = this;
	}


	public List<Template> getTemplates() {
		return templates;
	}

	public void loadTemplates(File root) {
		File[] files = root.listFiles();
		if (files != null) {
			for (File folder : root.listFiles()) {
				if (folder.isDirectory()) {
					loadTemplate(folder);
				}
			}
		}
	}

	public Template loadTemplate(File folder) {
		File metadata = new File(folder + "/template.xml");
		if (metadata.exists()) {
			try {
				final Template template = parse(metadata);
				template.setId(folder.getName());
				template.setFolder(folder);
				addTemplate(template);
				new Thread(new Runnable() {
					public void run() {
						monitorTemplate(template);
					}
				}).start();
				return template;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	private Template parse(File metadata) throws Exception {
		Digester digester = new Digester();
		digester.setValidating(false);
		digester.addObjectCreate("template", Template.class);
		digester.addBeanPropertySetter("template/name");
		digester.addBeanPropertySetter("template/type");
		digester.addBeanPropertySetter("template/selected");
		digester.addBeanPropertySetter("template/author");
		digester.addBeanPropertySetter("template/authorEmail");
		digester.addBeanPropertySetter("template/authorUrl");
		digester.addBeanPropertySetter("template/description");
		digester.addBeanPropertySetter("template/creationDate");
		digester.addBeanPropertySetter("template/copyright");
		digester.addBeanPropertySetter("template/license");
		digester.addBeanPropertySetter("template/version");
		return (Template) digester.parse(metadata);
	}
	
	@SuppressWarnings("unchecked")
	private void monitorTemplate(Template template) {
		try {
			WatchService watcher = FileSystems.getDefault().newWatchService();
			Path dir = Paths.get(template.getFolder().getAbsolutePath());
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
						if (fileName.equals("template.xml")) {
							reloadTemplate(template);
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

	private void reloadTemplate(Template template) {
		try {
			logger.log(Level.INFO, "reloading template  : " + template.getId());
			int index = template.getIndex();
			File folder = template.getFolder();
			template = parse(new File(folder + "/template.xml"));
			template.setId(folder.getName());
			template.setFolder(folder);
			template.setIndex(index);
			templates.set(index, template);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addTemplate(Template template) {
		template.setIndex(templates.size());
		templates.add(template);
	}

	public Template getTemplate(String id) {
		for (Template template : templates) {
			if (template.getId().equals(id))
				return template;
		}
		return null;
	}

	public Template getBackendTemplate(String id) {
		Template template = getTemplate(id);
		if (template != null && template.isBackend())
			return template;
		for (Template current : templates) {
			if (current.isSelected() && current.isBackend())
				return current;
		}
		for (Template current : templates) {
			if (current.isBackend())
				return current;
		}
		return null;
	}

	public Template getFrontendTemplate(String id) {
		Template template = getTemplate(id);
		if (template != null && template.isFrontend())
			return template;
		for (Template current : templates) {
			if (current.isSelected() && current.isFrontend())
				return current;
		}
		for (Template current : templates) {
			if (current.isFrontend())
				return current;
		}
		return null;
	}

	public void setTemplates(List<Template> templates) {
		this.templates = templates;
	}


	public static TemplateManager getInstance() {
		return instance;
	}

}