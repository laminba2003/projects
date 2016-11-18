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
		File[] files = root.listFiles();
		if(files!=null){
			for(File file : root.listFiles()) {
				if(file.isDirectory()) {
					loadTemplate(file);
				}
			}
		}
	}
	
	public Template loadTemplate(File folder) {
		TemplateLoader loader = new TemplateLoader();
		File metadata = new File(folder+File.separator+"template.xml");
		if(metadata.exists()) {
			try {
				Template template = loader.loadTemplate(metadata);
				template.setId(folder.getName());
				template.setFolder(folder);
				addTemplate(template);
				return template;
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return null;
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
	
	public Template getBackendTemplate(String id) {
		Template template = getTemplate(id);
		if(template!=null) return template;
		for(Template current : templates) {
			if(current.isSelected() && current.getType().equals("back-end")) return current;
		}
		for(Template current : templates) {
			if(current.getType().equals("back-end")) return current;
		}
		return null;
	}
	
	public Template getFrontendTemplate(String id) {
		Template template = getTemplate(id);
		if(template!=null) return template;
		for(Template current : templates) {
			if(current.isSelected() && current.getType().equals("front-end")) return current;
		}
		for(Template current : templates) {
			if(current.getType().equals("front-end")) return current;
		}
		return null;
	}


	public void setTemplates(List<Template> templates) {
		this.templates = templates;
	}

}