package org.metamorphosis.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.digester.Digester;

public class TemplateManager {

	private List<Template> templates = new ArrayList<Template>();

	public List<Template> getTemplates() {
		return templates;
	}

	public void loadTemplates(File root) {
		File[] files = root.listFiles();
		if(files!=null){
			for(File folder : root.listFiles()) {
				if(folder.isDirectory()) {
					loadTemplate(folder);
				}
			}
		}
	}
	
	public Template loadTemplate(File folder) {
		File metadata = new File(folder+"/template.xml");
		if(metadata.exists()) {
			try {
				Template template = parse(metadata);
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
	
	private Template parse(File metadata) throws Exception {
		Digester digester = new Digester();
		digester.setValidating( false );
		digester.addObjectCreate("template", Template.class );
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
		if(template!=null && template.isBackend()) return template;
		for(Template current : templates) {
			if(current.isSelected() && current.isBackend()) return current;
		}
		for(Template current : templates) {
			if(current.isBackend()) return current;
		}
		return null;
	}
	
	public Template getFrontendTemplate(String id) {
		Template template = getTemplate(id);
		if(template!=null && template.isFrontend()) return template;
		for(Template current : templates) {
			if(current.isSelected() && current.isFrontend()) return current;
		}
		for(Template current : templates) {
			if(current.isFrontend()) return current;
		}
		return null;
	}


	public void setTemplates(List<Template> templates) {
		this.templates = templates;
	}

}