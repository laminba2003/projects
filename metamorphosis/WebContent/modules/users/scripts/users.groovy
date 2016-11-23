import org.metamorphosis.core.ActionSupport;

class UserAction extends ActionSupport {

	String id;
	
	def signIn()  {
		def module = moduleManager.main ? moduleManager.main : moduleManager.defaultBackendModule;
		def url = module ? request.contextPath+"/"+module.url : request.contextPath+"/";
		response.sendRedirect(url);
	}
	
	def signOut() {
		SUCCESS;
	}
	
	def selectTemplate() {
		def template = templateManager.getTemplate(id);
		if(template && template.backend) {
			request.session.setAttribute("template",id);
			response.sendRedirect(request.getHeader("referer"));
		}
	}
	
}

new UserAction();
