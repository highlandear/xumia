package com.xumi.provider.model.mag;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 杂志单页数据
 * @author 
 *
 */
public class MagData {

	MagData() {
	}

	public MagData(String i, String p, String d, String o, String c) {
		this.id = i;
		this.path = p;
		this.desc = d;
		this.condition = c;
		this.owner = o;
	}
	
	public MagData(String i, String p, String d, String o) {
		this.id = i;
		this.path = p;
		this.desc = d;
		this.condition = "";
		this.owner = o;
	}
	
	public MagData addItem(MagAsset m) {this.assets.add(m);return this;}
	
	@JsonProperty("id")
	String id;
	
	@JsonProperty("path")
	String path;

	@JsonProperty("desc")
	String desc;
	
	// 获取条件
	@JsonProperty("condition")
	String condition;
	
	@JsonProperty("owner")
	String owner;
	
	@JsonIgnore
	java.util.List<MagAsset> assets = new java.util.ArrayList<MagAsset>();
}
