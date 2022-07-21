package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * NFT数据抽象类
 * 
 * @author
 *
 */
public abstract class NFTData {

	NFTData(int id){
		this.id = id;
	}
	
	public abstract int getType();

	// 字幕描述信息
	@JsonProperty("id")
	int id;
	@JsonProperty("type")
	int type;
	@JsonProperty("desc")
	String desc;
	@JsonProperty("ipfsHash")
	String nftpath;
	@JsonProperty("url")
	String url;
	@JsonProperty("extra")
	String extra;
}
