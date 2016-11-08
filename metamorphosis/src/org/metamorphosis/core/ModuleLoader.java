package org.metamorphosis.core;

import java.io.File;
import org.apache.commons.digester.Digester;

public class ModuleLoader {

	public Module loadModule(File file) throws Exception {
		Digester digester = new Digester();
		digester.setValidating(false);
		digester.addObjectCreate("module", Module.class);
		digester.addBeanPropertySetter("module/name");
		digester.addBeanPropertySetter("module/url");
		digester.addBeanPropertySetter("module/home");
		digester.addBeanPropertySetter("module/template");
		digester.addBeanPropertySetter("module/main");
		digester.addBeanPropertySetter("module/visible");
		digester.addBeanPropertySetter("module/administrable");
		digester.addBeanPropertySetter("module/order");
		digester.addBeanPropertySetter("module/author");
		digester.addBeanPropertySetter("module/authorEmail");
		digester.addBeanPropertySetter("module/authorUrl");
		digester.addBeanPropertySetter("module/creationDate");
		digester.addBeanPropertySetter("module/copyright");
		digester.addBeanPropertySetter("module/license");
		digester.addBeanPropertySetter("module/version");
		digester.addObjectCreate("module/menu", Menu.class);
		digester.addObjectCreate("module/menu/menuItem", MenuItem.class);
		digester.addSetProperties("module/menu/menuItem");
		digester.addSetNext("module/menu/menuItem", "addMenuItem");
		digester.addSetNext("module/menu", "setMenu");
		digester.addObjectCreate("module/actions/action", Action.class);
		digester.addSetProperties("module/actions/action");
		digester.addSetProperties("module/actions/action","class","className");
		digester.addObjectCreate("module/actions/action/result", Result.class);
		digester.addSetProperties("module/actions/action/result");
		digester.addSetNext("module/actions/action/result", "addResult");
		digester.addCallMethod("module/actions/action/result","setValue",0);
		digester.addSetNext("module/actions/action", "addAction");
		return (Module) digester.parse(file);
	}
}
