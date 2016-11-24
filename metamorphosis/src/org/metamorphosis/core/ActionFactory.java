package org.metamorphosis.core;

import java.io.File;
import java.io.FileReader;
import java.util.Map;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.factory.DefaultActionFactory;

public class ActionFactory extends DefaultActionFactory {

	@SuppressWarnings("rawtypes")
	@Override
	public Object buildAction(String actionName, String namespace, ActionConfig config, Map<String, Object> extraContext) throws Exception {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Module module = moduleManager.getCurrentModule(ServletActionContext.getRequest());
		if(module!=null) {
			Action action = module.getAction(actionName);
			if(action!=null && action.getScript()!=null) {
				File script = new File(module.getFolder()+"/scripts/"+action.getScript());
				if(script.exists()) {
					String name = script.getName();
					String extension = name.substring(name.indexOf(".")+1);
					ScriptEngine engine = new ScriptEngineManager().getEngineByExtension(extension);
				    Object object = engine.eval(new FileReader(script));
				    return object!=null ? object : engine.get("action");
				}
			}
			
		}
		return config.getClassName()!=null ? Class.forName(config.getClassName()).newInstance() : null;
	}

}