import org.metamorphosis.core.ActionSupport

class VideoAction extends ActionSupport {

	def id
	def query
	
	def watch()  {
	    id = request.getParameter("v")
	    if(id) {
			SUCCESS
		}
		else {
			response.sendRedirect(request.contextPath+"/")
		}
	}
	
	def search()  {
	    query = request.getParameter("search_query")
	    if(query) {
			SUCCESS
		}
		else {
			response.sendRedirect(request.contextPath+"/")
		}
	}
	
}

new VideoAction()