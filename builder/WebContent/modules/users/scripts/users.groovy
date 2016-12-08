import org.metamorphosis.core.ActionSupport

class UserAction extends ActionSupport {

	String id
	
	def login()  {
		def module = moduleManager.main
		def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		response.sendRedirect(url)
	}
	
	def logout() {
		SUCCESS
	}
	
	def selectTemplate() {
		def template = templateManager.getTemplate(id)
		if(template && template.backend) {
			session.setAttribute("template",id)
			response.sendRedirect(request.getHeader("referer"))
		}
	}
	
}

new UserAction()