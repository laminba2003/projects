package org.metamorphosis.core;

public class Template extends Extension {

	private String type="back-end";
	private boolean selected;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	
	public String getThumbnail() {
		return "templates/"+getId()+"/thumbnail.png";
	}
	
}
