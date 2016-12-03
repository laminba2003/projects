package org.metamorphosis.core;

import java.util.ArrayList;
import java.util.List;

public class Menu {

	private String position;
	private List<MenuItem> menuItems = new ArrayList<MenuItem>();

	public Menu() {
		
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Menu(List<MenuItem> menuItems) {
		this.menuItems=menuItems;
	}
	public void addMenuItem(MenuItem item) {
		menuItems.add(item);
	}
	public List<MenuItem> getMenuItems() {
		return menuItems;
	}
	public void setMenuItems(List<MenuItem> menuItems) {
		this.menuItems = menuItems;
	}
	
}
