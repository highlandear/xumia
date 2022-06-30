package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * NFT数据抽象类
 * @author
 *
 */
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
	
	// 字幕描述信息
	@JsonProperty("caption")
	String caption = "";
	
	// 作者信息
	@JsonProperty("author")
	String author = "";
	
	// 数据，比如ipfs地址等
	@JsonProperty("data")
	String data;
}
