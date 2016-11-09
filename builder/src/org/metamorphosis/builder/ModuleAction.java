package org.metamorphosis.builder;

import java.util.Map;
import org.metamorphosis.core.Module;
import org.metamorphosis.core.ModuleManager;
import java.io.BufferedReader;
import java.io.FileReader;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ModuleAction extends ActionSupport {

	private String id;

	public String execute() {
		return SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@SuppressWarnings("rawtypes")
	public String getContent() {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Module module = moduleManager.getModuleById(id);
		String sCurrentLine,content="";
		try {
	        BufferedReader br = new BufferedReader(new FileReader(module.getFolder()+"/"+module.getHome()));
			while ((sCurrentLine = br.readLine()) != null) {
				content+=sCurrentLine+"\n";
			}
			br.close();
			return content;
		}catch(Exception es) {
			es.printStackTrace();
		}
		return "";
	}
	
	public String getType() {
		return "Modules";
	}

}
