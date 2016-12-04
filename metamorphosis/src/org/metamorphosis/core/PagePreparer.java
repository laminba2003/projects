package org.metamorphosis.core;

import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import com.opensymphony.xwork2.ActionContext;
import java.io.IOException;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;

public class PagePreparer implements ViewPreparer {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(TilesRequestContext requestContext, AttributeContext attributeContext) throws PreparerException {
		
		try {
			Module module = (Module) ServletActionContext.getRequest().getAttribute("module");
			Map application = (Map) ActionContext.getContext().get("application");
			ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
			if(module!=null && module.isBackend()) {
				if(module.isChanged())
					try {
						moduleManager.rebuild(module,requestContext);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				String id = (String) requestContext.getSessionScope().get("template");
				
				TemplateManager templateManager = (TemplateManager) application.get("templateManager");
				Template template = templateManager.getTemplate(id);
				if(template!=null && template.isBackend()) requestContext.dispatch("/templates/"+template.getId()+"/index.jsp");
			}else {
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
    
}