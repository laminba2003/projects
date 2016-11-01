package org.metamorphosis.core;

import java.io.IOException;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport {

	@SuppressWarnings("rawtypes")
	public void signIn() throws IOException {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Module module = moduleManager.getModules().get(0);
		String contextPath = ServletActionContext.getRequest().getContextPath();
		ServletActionContext.getResponse().sendRedirect(contextPath+"/"+module.getUrl());
	}
	
	public String signOut() {
		return SUCCESS;
	}
	
}
