package com.xumi.provider.model.magz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

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
		this.owner = owner;
		this.condition = "";
		this.price = price;
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
	
	@JsonProperty("owner")
	String owner;	
	
	// 获取条件
	@JsonProperty("condition")
	String condition;
	
	@JsonProperty("price")
	String price;
	
	@JsonIgnore
	NFTData data = null;
}
