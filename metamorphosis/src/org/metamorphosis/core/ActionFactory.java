package org.metamorphosis.core;

import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.factory.DefaultActionFactory;

public class ActionFactory extends DefaultActionFactory {

	@SuppressWarnings("rawtypes")
	@Override
	public Object buildAction(String url, String namespace, ActionConfig config,Map<String, Object> extraContext) throws Exception {
		Map application = (Map) ActionContext.getContext().get("application");
		ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
		Object object = moduleManager.buildAction(url);
		return object!=null ? object : super.buildAction(url,namespace,config,extraContext);
	}

}