package org.metamorphosis.core;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class ModuleInterceptor extends AbstractInterceptor {

	@SuppressWarnings("rawtypes")
	@Override
	public String intercept(ActionInvocation invocation)  {
		try {
			Map application = (Map) ActionContext.getContext().get("application");
			ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
			Module module = moduleManager.getCurrentModule();
			if(module!=null) {
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("modules",moduleManager.getVisibleModules(module.getType()));
				request.setAttribute("module",module);
				String uri = request.getRequestURI();
				String actionURI = uri.substring(request.getContextPath().length()+1,uri.length());
				request.setAttribute("title",actionURI);
				request.setAttribute("js","modules/"+module.getId()+"/js");
				request.setAttribute("css","modules/"+module.getId()+"/css");
				request.setAttribute("images","modules/"+module.getId()+"/images");
				List<MenuItem> items = new ArrayList<MenuItem>();
				if(module.getMenu()!=null) {
					for(MenuItem item : module.getMenu().getMenuItems()) {
						if(item.isVisible())items.add(item);
						if(item.getName()!=null)
							request.setAttribute(item.getName(),item.getUrl());
					}
				}
				request.setAttribute("menu",new Menu(items));
				for(Action action : module.getActions()) {
					if(action.getName()!=null && !action.isGlobal())
					request.setAttribute(action.getName(),module.getUrl()+"/"+action.getUrl());
				}
			}
			return invocation.invoke();
		}catch(Exception e) {

		}
		return "error";
	}
}
