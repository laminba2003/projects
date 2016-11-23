package org.metamorphosis.core;

import javax.servlet.http.HttpServletRequest;

@SuppressWarnings("serial")
public class WelcomeAction extends ActionSupport {

	public String execute() {
		ModuleManager moduleManager = (ModuleManager) getApplication().get("moduleManager");
		HttpServletRequest request = getRequest();
		request.setAttribute("modules",moduleManager.getVisibleModules("front-end"));
		request.setAttribute("title", "Home");
		return SUCCESS;
	}
}
