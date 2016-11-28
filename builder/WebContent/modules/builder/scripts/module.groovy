import org.metamorphosis.core.ActionSupport

class ModuleAction extends ActionSupport {

	String id
	
	def getContent() {
		def module = moduleManager.getModuleById(id)
		def sCurrentLine,content=""
	    def file = module.folder.absolutePath+"/"+module.home
        def br = new BufferedReader(new FileReader(file))
		while ((sCurrentLine = br.readLine())!=null) {
			content+=sCurrentLine+"\n"
		}
		br.close()
		return content
	}
	
	def getType() {
		return "Modules"
	}

}

new ModuleAction()