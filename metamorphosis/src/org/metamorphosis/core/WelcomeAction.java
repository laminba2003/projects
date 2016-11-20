package org.metamorphosis.core;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class WelcomeAction extends ActionSupport {

	@SuppressWarnings("rawtypes")
	public String execute() {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("modules",moduleManager.getVisibleModules("front-end"));
		request.setAttribute("title", "Home");
		return SUCCESS;
	}
	
}
