package org.metamorphosis.core;

import java.io.File;
import org.apache.commons.digester.Digester;

public class ModuleLoader {

	public Module loadModule(File file) throws Exception {
		Digester digester = new Digester();
        digester.setValidating( false );
        digester.addObjectCreate("module", Module.class );
        digester.addBeanPropertySetter("module/name");
        digester.addBeanPropertySetter("module/url");
        digester.addBeanPropertySetter("module/author");
        digester.addBeanPropertySetter("module/authorEmail");
        digester.addBeanPropertySetter("module/authorUrl");
        digester.addBeanPropertySetter("module/creationDate");
        digester.addBeanPropertySetter("module/copyright");
        digester.addBeanPropertySetter("module/license");
        digester.addBeanPropertySetter("module/version");
		return (Module) digester.parse(file);
	}
}
