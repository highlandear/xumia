package com.xumi.provider.model.mag;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagTicket implements MagAsset {
	
	MagTicket(){}
	public MagTicket(String p, String d){this.path = p; this.desc = d;}
	
	@Override
	public String tocken() {
		return "ticket";
	}

	@JsonProperty("path")
	String path;
	
	@JsonProperty("desc")
	String desc;
}
