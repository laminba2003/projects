import java.io.IOException;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TemplateAction extends ActionSupport {

	String id;
	
	def selectTemplate() {
		def application = ActionContext.getContext().get("application");
		def templateManager = application.get("templateManager");
		def template = templateManager.getTemplate(id);
		if(template!=null && template.isBackend()) {
			def referer = ServletActionContext.getRequest().getHeader("referer");
			ServletActionContext.getRequest().getSession().setAttribute("template",id);
			ServletActionContext.getResponse().sendRedirect(referer);
		}
	}
	
}

new TemplateAction();
