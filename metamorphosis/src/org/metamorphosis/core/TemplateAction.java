package org.metamorphosis.core;

import java.io.IOException;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TemplateAction extends ActionSupport {

	private String id;
	
	@SuppressWarnings("rawtypes")
	public void selectTemplate() throws IOException {
		Map application = (Map) ActionContext.getContext().get("application");
		TemplateManager templateManager = (TemplateManager) application.get("templateManager");
		Template template = templateManager.getTemplate(id);
		if(template!=null && template.getType().equals("back-end")) {
			String referer = ServletActionContext.getRequest().getHeader("referer");
			ServletActionContext.getRequest().getSession().setAttribute("template",id);
			ServletActionContext.getResponse().sendRedirect(referer);
		}
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
