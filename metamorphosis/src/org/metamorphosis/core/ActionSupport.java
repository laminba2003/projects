package org.metamorphosis.core;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class ActionSupport extends com.opensymphony.xwork2.ActionSupport {

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	
	public HttpSession getSession() {
		return ServletActionContext.getRequest().getSession();
	}
	
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	@SuppressWarnings("rawtypes")
	public Map getApplication() {
		return (Map) ActionContext.getContext().get("application");
	}
	
	public ModuleManager getModuleManager() {
		return ModuleManager.getInstance();
	}
	public Module getModule() {
		return getModuleManager().getCurrentModule();
	}
	public TemplateManager getTemplateManager() {
		return TemplateManager.getInstance();
	}
}
