package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagData {

	MagData() {
	}

	MagData(String i, String p, String d) {
		this.id = i;
		this.path = p;
		this.desc = d;
	}
	
	@JsonProperty("id")
	String id;
	
	@JsonProperty("path")
	String path;

	@JsonProperty("desc")
	String desc;
}
