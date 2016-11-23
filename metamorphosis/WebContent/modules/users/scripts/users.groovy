import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

class UserAction extends ActionSupport {

	String id;
	
	def signIn()  {
		def application = ActionContext.context.get("application");
		def moduleManager = application["moduleManager"];
		def module = moduleManager.main!=null ? moduleManager.main : moduleManager.defaultBackendModule;
		def contextPath = ServletActionContext.request.contextPath;
		def url = module ? contextPath+"/"+module.url : contextPath+"/";
		ServletActionContext.response.sendRedirect(url);
	}
	
	def signOut() {
		return SUCCESS;
	}
	
	def selectTemplate() {
		def application = ActionContext.context.get("application");
		def templateManager = application["templateManager"];
		def template = templateManager.getTemplate(id);
		if(template && template.backend) {
			def referer = ServletActionContext.request.getHeader("referer");
			ServletActionContext.request.session.setAttribute("template",id);
			ServletActionContext.response.sendRedirect(referer);
		}
	}
	
}

new UserAction();
