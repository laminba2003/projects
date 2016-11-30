import org.metamorphosis.core.ActionSupport

class UserAction extends ActionSupport {

	String id
	
	def signIn()  {
		moduleManager.signIn()
	}
	
	def signOut() {
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
