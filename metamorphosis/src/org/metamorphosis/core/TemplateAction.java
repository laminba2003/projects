package org.metamorphosis.core;

import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TemplateAction extends ActionSupport {

	private String id;
	private Template template;
	
	@SuppressWarnings("rawtypes")
	public String selectTemplate() {
		Map application = (Map) ActionContext.getContext().get("application");
		TemplateManager templateManager = (TemplateManager) application.get("templateManager");
		if(templateManager.getTemplate(id)!=null) {
			ServletActionContext.getRequest().getSession().setAttribute("template",id);
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("rawtypes")
	public String showTemplateDetails() {
	   Map application = (Map) ActionContext.getContext().get("application");
	   TemplateManager templateManager = (TemplateManager) application.get("templateManager");
	   template = templateManager.getTemplate(id);
	   return template!=null ? SUCCESS : ERROR;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Template getSelected() {
		return template;
	}

	
}
