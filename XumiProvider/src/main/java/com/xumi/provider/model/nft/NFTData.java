package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonProperty;

public abstract class NFTData {
	
	NFTData(String data){this.data = data;}	
	
	abstract public String getType();
	
	public NFTData addCaption(String s) {
		this.caption = s;		
		return this;
	}
	
	public NFTData addAuthor(String s) {
		this.author = s;
		return this;
	}
	
	@JsonProperty("caption")
	String caption = "";
	
	@JsonProperty("author")
	String author = "";
	
	@JsonProperty("data")
	String data;
}
