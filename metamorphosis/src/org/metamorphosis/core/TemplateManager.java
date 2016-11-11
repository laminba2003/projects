package org.metamorphosis.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class TemplateManager {

	private List<Template> templates = new ArrayList<Template>();

	public List<Template> getTemplates() {
		return templates;
	}

	public void loadTemplates(File root) {
		TemplateLoader loader = new TemplateLoader();
		for(File file : root.listFiles()) {
			if(file.isDirectory()) {
				File metadata = new File(file+File.separator+"template.xml");
				if(metadata.exists()) {
					try {
						Template template = loader.loadTemplate(metadata);
						template.setId(file.getName());
						template.setFolder(file);
						addTemplate(template);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
	}

	public void addTemplate(Template template) {
		templates.add(template);
	}

	public Template getTemplate(String id) {
		for(Template template : templates) {
			if(template.getId().equals(id)) return template;
		}
		return null;
	}
	
	public Template getSelectedTemplate(String id) {
		Template template = getTemplate(id);
		if(template!=null) return template;
		for(Template current : templates) {
			if(current.isSelected()) return current;
		}
		return templates.get(0);
	}

	public void setTemplates(List<Template> templates) {
		this.templates = templates;
	}

}