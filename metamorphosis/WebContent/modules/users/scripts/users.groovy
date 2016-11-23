import org.metamorphosis.core.ActionSupport;

class UserAction extends ActionSupport {

	String id;
	
	def signIn()  {
		def moduleManager = application["moduleManager"];
		def module = moduleManager.main!=null ? moduleManager.main : moduleManager.defaultBackendModule;
		def contextPath = request.contextPath;
		def url = module ? contextPath+"/"+module.url : contextPath+"/";
		response.sendRedirect(url);
	}
	
	def signOut() {
		return SUCCESS;
	}
	
	def selectTemplate() {
		def templateManager = application["templateManager"];
		def template = templateManager.getTemplate(id);
		if(template && template.backend) {
			def referer = request.getHeader("referer");
			request.session.setAttribute("template",id);
			response.sendRedirect(referer);
		}
	}
	
}

new UserAction();
