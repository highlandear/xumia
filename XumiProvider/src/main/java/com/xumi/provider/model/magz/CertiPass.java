package com.xumi.provider.model.magz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.xumi.provider.model.nft.NFTData;

/**
 * 通证基本信息
 * 
 * @author
 *
 */
public final class CertiPass {
	
	CertiPass() {
	}

	

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
