package org.metamorphosis.core;

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
    public String intercept(ActionInvocation invocation) throws Exception {
            HttpServletRequest request = ServletActionContext.getRequest();
            String uri = request.getRequestURI();
            String url = uri.substring(request.getContextPath().length()+1,uri.length());
            String action = url;
            url = url.indexOf("/")!=-1 ? url.substring(0,url.indexOf("/")) : url;
            Map application = (Map) ActionContext.getContext().get("application");
    		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
    		Module module = moduleManager.getModuleByUrl(url); 
    		request.setAttribute("module",module);
    		request.setAttribute("title",action);
    		 if(module.getMenu()!=null) {
 			    for(MenuItem item : module.getMenu().getMenuItems()) {
 					if(item.getAction().equals(action)) {
 						request.setAttribute("title",item.getTitle());
 						break;
 					}
 				}
 		    }
            return invocation.invoke();
    }
}
