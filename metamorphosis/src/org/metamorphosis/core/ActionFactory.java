package org.metamorphosis.core;

import java.io.File;
import java.io.FileReader;
import java.util.Map;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.factory.DefaultActionFactory;

public class ActionFactory extends DefaultActionFactory {

	@SuppressWarnings("rawtypes")
	@Override
	public Object buildAction(String actionName, String namespace, ActionConfig config, Map<String, Object> extraContext) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String uri = request.getRequestURI();
		String url = uri.substring(request.getContextPath().length()+1,uri.length());
		url = url.indexOf("/")!=-1 ? url.substring(0,url.indexOf("/")) : url;
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Module module = moduleManager.getModuleByUrl(url); 
		module = module!=null ? module : moduleManager.getModuleByUrl("/");
		if(module!=null) {
			Action action = module.getAction(actionName);
			if(action!=null && action.getScript()!=null) {
				File file = new File(module.getFolder()+"/scripts/"+action.getScript());
				if(file.exists()) {
					String name = file.getName();
					String extension = name.substring(name.indexOf(".")+1);
					ScriptEngineManager manager = new ScriptEngineManager();
					ScriptEngine engine = manager.getEngineByExtension(extension);
					return engine.eval(new FileReader(file));
				}
			}
			
		}
		return config.getClassName()!=null ? Class.forName(config.getClassName()).newInstance() : null;
	}

}