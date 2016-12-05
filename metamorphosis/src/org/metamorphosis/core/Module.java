package org.metamorphosis.core;

import java.util.ArrayList;
import java.util.List;

public class Module extends Extension {

	private int order;
	private String url;
	private boolean main;
	private boolean visible = true;
	private boolean administrable = true;
	private String home = "index.jsp";
	private List<Menu> menus = new ArrayList<Menu>();
	private List<Action> actions = new ArrayList<Action>();

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isMain() {
		return main;
	}

	public void setMain(boolean main) {
		this.main = main;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public boolean isAdministrable() {
		return administrable;
	}

	public void setAdministrable(boolean administrable) {
		this.administrable = administrable;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	
	public void addMenu(Menu menu) {
		menus.add(menu);
	}

	public List<Action> getActions() {
		return actions;
	}

	public void setActions(List<Action> actions) {
		this.actions = actions;
	}

	public void addAction(Action action) {
		actions.add(action);
	}
	
	public Action getAction(String url) {
		for(Action action : actions) {
			if(action.getUrl()!=null && action.getUrl().equals(url)) {
				return action;
			}
		}
		return null;
	}

	public String getIcon() {
		return "modules/" + id + "/images/icon-16.png";
	}

	public String getPath() {
		return "modules/" + folder.getName();
	}

}