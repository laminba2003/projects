package org.metamorphosis.core;

import javax.servlet.http.HttpServletRequest;

@SuppressWarnings("serial")
public class WelcomeAction extends ActionSupport {

	public String execute() {
		HttpServletRequest request = getRequest();
		request.setAttribute("modules",getModuleManager().getVisibleModules("front-end"));
		request.setAttribute("title", "Home");
		return SUCCESS;
	}
}
