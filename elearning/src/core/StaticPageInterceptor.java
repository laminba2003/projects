package core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class StaticPageInterceptor  extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
            HttpServletRequest request = ServletActionContext.getRequest();
            String uri = request.getRequestURI();
            String module = uri.substring(request.getContextPath().length()+1,uri.length());
            module = module.indexOf("/")!=-1 ? module.substring(0,module.indexOf("/")) : module;
            request.setAttribute("module", request.getContextPath()+"/"+module);
            request.setAttribute("css", request.getContextPath()+"/modules"+"/"+module+"/css");
            request.setAttribute("js", request.getContextPath()+"/modules"+"/"+module+"/js");
            request.setAttribute("images", request.getContextPath()+"/modules"+"/"+module+"/images");
            //HttpServletResponse response = ServletActionContext.getResponse();
            //response.setHeader("Cache-control", "private, max-age=600");
            return invocation.invoke();
    }
}
