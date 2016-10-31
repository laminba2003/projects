package core;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {

	public Map<String, Object> getSession() {
		return ServletActionContext.getContext().getSession();
	}
	
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	
}
