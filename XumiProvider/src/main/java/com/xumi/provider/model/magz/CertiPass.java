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
	public static CertiPass create(String id, String cover, String desc, String detail, String owner, String price) {
		return new CertiPass(id, cover, desc, detail, owner, price);
	}

	CertiPass() {
	}

	private CertiPass(String id, String cover, String desc, String detail, String owner, String price) {
		this.id = id;
		this.cover = cover;
		this.desc = desc;
		this.detail = detail;
		this.price = price;
	}

	CertiPass with(NFTData data) {
		nft = data;
		return this;
	}

	CertiPass with(String prodid) {
		productid = prodid;
		return this;
	}

	public NFTData getNft() {
		return this.nft;
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
