package org.metamorphosis.core;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class ModuleInterceptor  extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
            HttpServletRequest request = ServletActionContext.getRequest();
            String uri = request.getRequestURI();
            String module = uri.substring(request.getContextPath().length()+1,uri.length());
            module = module.indexOf("/")!=-1 ? module.substring(0,module.indexOf("/")) : module;
            request.setAttribute("module", module);
            return invocation.invoke();
    }
}
