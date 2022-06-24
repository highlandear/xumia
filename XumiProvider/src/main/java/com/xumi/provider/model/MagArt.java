package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MagArt implements MagAsset {

	MagArt(){}
	MagArt(String path){this.path = path;}
	
	@Override
	public String tocken() {
		return "art";
	}
	
	@JsonProperty("path")
	String path;	
}
