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
		if(templateManager.getTemplate(id)!=null) {
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
