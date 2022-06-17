package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagData {

	MagData() {
	}

	MagData(String p, String d) {
		this.path = p;
		this.desc = d;
	}

	@JsonProperty("path")
	String path;

	@JsonProperty("desc")
	String desc;
}
