package org.metamorphosis.core;

public class Module extends Extension {

	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getIcon() {
		return "modules/"+getId()+"/images/icon-16.png";
	}
}
