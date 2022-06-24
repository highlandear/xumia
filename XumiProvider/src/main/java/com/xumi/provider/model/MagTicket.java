package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagTicket implements MagAsset {
	@Override
	public String tocken() {
		return "ticket";
	}
	
	@JsonProperty("value")
	String value = this.getClass().descriptorString();
	
}
