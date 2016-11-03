package org.metamorphosis.core;

import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TemplateAction extends ActionSupport {

	private String id;
	
	@SuppressWarnings("rawtypes")
	public String selectTemplate() {
		Map application = (Map) ActionContext.getContext().get("application");
		TemplateManager templateManager = (TemplateManager) application.get("templateManager");
		if(templateManager.getTemplate(id)!=null) {
			ServletActionContext.getRequest().getSession().setAttribute("template",id);
		}
		return SUCCESS;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
