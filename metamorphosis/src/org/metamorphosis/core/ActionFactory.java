package org.metamorphosis.core;

import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.factory.DefaultActionFactory;

public class ActionFactory extends DefaultActionFactory {

	@SuppressWarnings("rawtypes")
	@Override
	public Object buildAction(String actionName, String namespace, ActionConfig config,Map<String, Object> extraContext) throws Exception {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Object object = moduleManager.buildAction(actionName);
		return object!=null ? object : config.getClassName() != null ? Class.forName(config.getClassName()).newInstance() : null;
	}

}