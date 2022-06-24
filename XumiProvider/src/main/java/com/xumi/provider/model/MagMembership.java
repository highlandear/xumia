package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagMembership implements MagAsset {
	@Override
	public String tocken() {
		return "card";
	}
	
	@JsonProperty("value")
	String value = this.getClass().descriptorString();
}
