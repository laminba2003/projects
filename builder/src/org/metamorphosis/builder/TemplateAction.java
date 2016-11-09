package org.metamorphosis.builder;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Map;
import org.metamorphosis.core.Template;
import org.metamorphosis.core.TemplateManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TemplateAction extends ActionSupport {

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
		TemplateManager templateManager = (TemplateManager) application.get("templateManager");
		Template template = templateManager.getTemplate(id);
		String sCurrentLine,content="";
		try {
	        BufferedReader br = new BufferedReader(new FileReader(template.getFolder()+"/index.jsp"));
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
		return "Templates";
	}

}
