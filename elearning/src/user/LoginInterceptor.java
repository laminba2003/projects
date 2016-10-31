package user;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class LoginInterceptor  extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
            Map<String, Object> session = invocation.getInvocationContext().getSession();
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setHeader("Cache-control", "no-cache, no-store");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "-1");
            String loginId = (String) session.get("user");
            if (loginId == null) 
            {
                    return Action.LOGIN;
            } 
            else 
            {
                    return invocation.invoke();
            }
    }
}