import org.metamorphosis.core.ActionSupport

class TemplateAction extends ActionSupport {

	String id
	
	def getContent() {
		def template = templateManager.getTemplate(id)
		def sCurrentLine,content=""
		def file = template.folder.absolutePath+"/index.jsp"
	    def br = new BufferedReader(new FileReader(file))
		while ((sCurrentLine = br.readLine())!=null) {
			content+=sCurrentLine+"\n"
		}
		br.close()
		return content
	}
	
	def getType() {
		return "Templates"
	}

}

new TemplateAction()