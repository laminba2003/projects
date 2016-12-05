package org.metamorphosis.core;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class ModuleInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation)  {
		try {
			ModuleManager moduleManager = ModuleManager.getInstance();
		    Module module = moduleManager.getCurrentModule();
			if(module!=null) {
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("modules",moduleManager.getVisibleModules(module.getType()));
				request.setAttribute("module",module);
				String uri = request.getRequestURI();
				String actionURL = uri.substring(request.getContextPath().length()+1,uri.length());
				request.setAttribute("title",actionURL);
				request.setAttribute("js","modules/"+module.getId()+"/js");
				request.setAttribute("css","modules/"+module.getId()+"/css");
				request.setAttribute("images","modules/"+module.getId()+"/images");
				List<MenuItem> items = new ArrayList<MenuItem>();
				for(Menu menu : module.getMenus())  {
					for(MenuItem item : menu.getMenuItems()) {
						if(item.isVisible())items.add(item);
						if(item.getName()!=null)
							request.setAttribute(item.getName(),item.getUrl());
						if(item.getUrl().equals(actionURL) && item.getTitle()!=null) {
							request.setAttribute("title",item.getTitle());
						}
					}
				}
				request.setAttribute("menu",new Menu(items));
				for(Action action : module.getActions()) {
					String url = module.getUrl()+"/"+action.getUrl();
					if(action.getName()!=null && !action.isGlobal()) {
					  request.setAttribute(action.getName(),url);
					}
					if(url.equals(actionURL) && action.getTitle()!=null) {
						request.setAttribute("title",action.getTitle());
					}
				}
			}
			return invocation.invoke();
		}catch(Exception e) {

		}
		return "error";
	}
}
