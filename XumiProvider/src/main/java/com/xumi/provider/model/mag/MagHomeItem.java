package com.xumi.provider.model.mag;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagHomeItem implements MagAsset {
	@Override
	public String tocken() {
		return "home";
	}
	
	@JsonProperty("value")
	String value;
}
