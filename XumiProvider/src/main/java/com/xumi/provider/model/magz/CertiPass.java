package com.xumi.provider.model.magz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.xumi.provider.model.nft.NFTData;

public final class CertiPass {
	public static CertiPass create(String id,  String cover, String desc, String detail, String owner, String price) {
		return new CertiPass(id, cover, desc, detail, owner, price);
	}
	
	CertiPass(){}
	
	private CertiPass(String id, String cover, String desc, String detail, String owner, String price){
		this.id = id;
		this.cover = cover;
		this.desc = desc;
		this.detail = detail;
	//	this.owner = owner;
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
	String id;
	
	// 封面
	@JsonProperty("cover")
	String cover;		
	
	@JsonProperty("detail")
	String detail;

	// 描述信息
	@JsonProperty("desc")
	String desc;
	
	// 获取条件
	@JsonProperty("productid")
	String productid = "";
	
	@JsonProperty("price")
	String price;
	
	@JsonIgnore
	NFTData nft;
}
