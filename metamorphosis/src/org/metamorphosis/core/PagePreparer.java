package org.metamorphosis.core;

import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import java.io.IOException;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;

public class PagePreparer implements ViewPreparer {

	@Override
	public void execute(TilesRequestContext requestContext, AttributeContext attributeContext) throws PreparerException {
		
		try {
			String template = (String) requestContext.getSessionScope().get("template");
			if(template!=null) requestContext.dispatch("/templates/"+template+"/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
    
}