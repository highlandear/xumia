package com.xumi.provider.model;

public class MagHomeItem implements MagAsset {
	@Override
	public String tocken() {
		return "home";
	}
	String value = this.getClass().descriptorString();
}
