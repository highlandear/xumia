package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonProperty;

public abstract class NFTData {
	
	NFTData(String type){this.type = type;}
	
	public String getType() {return type;}
	
	@JsonProperty("type")
	String type;
	
	@JsonProperty("data")
	String data;
}
