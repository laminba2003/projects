package org.metamorphosis.core;

import java.io.File;
import org.apache.commons.digester.Digester;

public class TemplateLoader {

	public Template loadTemplate(File file) throws Exception {
		Digester digester = new Digester();
		digester.setValidating( false );
		digester.addObjectCreate("template", Template.class );
		digester.addBeanPropertySetter("template/name");
		digester.addBeanPropertySetter("template/type");
		digester.addBeanPropertySetter("template/selected");
		digester.addBeanPropertySetter("template/author");
		digester.addBeanPropertySetter("template/authorEmail");
		digester.addBeanPropertySetter("template/authorUrl");
		digester.addBeanPropertySetter("template/description");
		digester.addBeanPropertySetter("template/creationDate");
		digester.addBeanPropertySetter("template/copyright");
		digester.addBeanPropertySetter("template/license");
		digester.addBeanPropertySetter("template/version");
		return (Template) digester.parse(file);
	}
}
