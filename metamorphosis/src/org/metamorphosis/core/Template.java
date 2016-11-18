package org.metamorphosis.core;

public class Template extends Extension {

	private boolean selected;

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
