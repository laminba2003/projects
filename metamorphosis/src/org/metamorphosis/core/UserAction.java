package org.metamorphosis.core;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport {

	@SuppressWarnings("rawtypes")
	public String welcome() {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("modules",moduleManager.getVisibleModules("front-end"));
		request.setAttribute("title", "Home");
		return SUCCESS;
	}
	
	@SuppressWarnings("rawtypes")
	public void signIn() throws IOException {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Module module = moduleManager.getMain()!=null ? moduleManager.getMain() : moduleManager.getDefaultBackendModule();
		String contextPath = ServletActionContext.getRequest().getContextPath();
		String url = module!=null ? contextPath+"/"+module.getUrl() : contextPath+"/";
		ServletActionContext.getResponse().sendRedirect(url);
	}
	
	public String signOut() {
		return SUCCESS;
	}
	
}
