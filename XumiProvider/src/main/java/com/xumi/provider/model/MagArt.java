package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagArt implements MagAsset {

	MagArt(){}
	MagArt(String path, String desc, String owner){this.path = path; this.desc = desc;}
	
	@Override
	public String tocken() {
		return "art";
	}
	
	@JsonProperty("path")
	String path;
	
	@JsonProperty("desc")
	String desc;
	
	@JsonProperty("owner")
	String owner;
}
