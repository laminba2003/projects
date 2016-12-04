package org.metamorphosis.core;

import org.apache.tiles.TilesContainer;
import org.apache.tiles.TilesException;
import org.apache.tiles.mgmt.MutableTilesContainer;

public class TilesContainerFactory extends org.apache.tiles.factory.TilesContainerFactory {

	 public TilesContainer createContainer(Object context) throws TilesException {
		 System.out.println("better way");
		 return createMutableTilesContainer(context);
	 }
	 
	 public MutableTilesContainer createMutableTilesContainer(Object context)
		        throws TilesException {
		        CachingTilesContainer container = new CachingTilesContainer();
		        initializeContainer(context, container);
		        return container;
	}
	 
}
