package org.metamorphosis.core;

public class Module extends Extension {

	private int order;
	private String url;
    private boolean main;
    
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
	public String getIcon() {
		return "modules/"+getId()+"/images/icon-16.png";
	}
	
}
