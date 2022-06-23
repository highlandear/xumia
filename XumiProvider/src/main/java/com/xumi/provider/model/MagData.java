package com.xumi.provider.model;

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

	MagData(String i, String p,  String c, String d, String o) {
		this.id = i;
		this.path = p;
		this.desc = d;
		this.condition = c;
		this.owner = o;
	}
	
	MagData(String i, String p, String d, String o) {
		this.id = i;
		this.path = p;
		this.desc = d;
		this.condition = "";
		this.owner = o;
	}
	
	MagData addItem(MagItem m) {this.items.add(m);return this;}
	
	@JsonProperty("id")
	String id;
	
	@JsonProperty("path")
	String path;

	@JsonProperty("desc")
	String desc;
	
	@JsonProperty("condition")
	String condition;
	
	@JsonProperty("owner")
	String owner;
	
	@JsonIgnore
	java.util.List<MagItem> items = new java.util.ArrayList<MagItem>();
}
