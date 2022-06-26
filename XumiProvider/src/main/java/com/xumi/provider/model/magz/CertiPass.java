package com.xumi.provider.model.magz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public abstract class CertiPass {
	
	CertiPass(){}
	
	protected CertiPass(String i, String t, String c, String d, String o){
		this.id = i;
		this.cover = c;
		this.desc = d;
		this.owner = o;
		this.condition = "";
		this.type = t;
	}
	
	String getType() {return type;}
	
	CertiPass with(NFTData nft) {
		this.data = nft;
		return this;
	}
	
	@JsonProperty("id")
	String id;
	
	@JsonProperty("cover")
	String cover;

	@JsonProperty("desc")
	String desc;
	
	@JsonProperty("owner")
	String owner;	
	
	// 获取条件
	@JsonProperty("condition")
	String condition;
	
	@JsonProperty("type")
	String type;
	
	@JsonIgnore
	NFTData data = null;
}
