package org.metamorphosis.core;

import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import com.opensymphony.xwork2.ActionContext;
import java.io.IOException;
import java.util.Map;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;

public class PagePreparer implements ViewPreparer {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(TilesRequestContext tilesContext, AttributeContext attributeContext) throws PreparerException {
		
		try {
			Map application = (Map) ActionContext.getContext().get("application");
			ModuleManager moduleManager = (ModuleManager) application.get("moduleManager");
			TemplateManager templateManager = (TemplateManager) application.get("templateManager");
			String id = (String) tilesContext.getSessionScope().get("template");
			Template template = templateManager.getTemplate(id);
			Module module = moduleManager.getCurrentModule();
			if(module!=null && module.isBackend()) {
				template = template!=null && template.isBackend() ? template : templateManager.getBackendTemplate(null);
				if(module.isReloaded()) {
					try {
						moduleManager.registerPages(module,template.getIndexPage(),tilesContext);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				tilesContext.dispatch(template.getIndexPage());
			}else if(module!=null && module.isFrontend()) {
				template = template!=null && template.isFrontend() ? template : templateManager.getFrontendTemplate(null);
				if(module.isReloaded()) {
					try {
						moduleManager.registerPages(module,template.getIndexPage(),tilesContext);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				tilesContext.dispatch(template.getIndexPage());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
    
}