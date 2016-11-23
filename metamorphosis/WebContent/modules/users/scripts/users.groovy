import java.io.IOException;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	String id;
	
	def signIn()  {
		def application = ActionContext.getContext().get("application");
		def moduleManager = application.get("moduleManager");
		def module = moduleManager.getMain()!=null ? moduleManager.getMain() : moduleManager.getDefaultBackendModule();
		def contextPath = ServletActionContext.getRequest().getContextPath();
		def url = module!=null ? contextPath+"/"+module.getUrl() : contextPath+"/";
		ServletActionContext.getResponse().sendRedirect(url);
	}
	
	def signOut() {
		return SUCCESS;
	}
	
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

new UserAction();
