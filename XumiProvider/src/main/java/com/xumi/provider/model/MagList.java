package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;



public class MagList {

	
	MagList(){}
	MagList(String s){this.staus = s;}
	
	@JsonProperty(value = "status")
	String staus;
	
	@JsonProperty(value = "data")
	java.util.List<MagData> data = new java.util.ArrayList<MagData>();
		
	
	public String toJson() {
		return JsonObj.toJson(this);
	}
	
	public void add(MagData d) {
		data.add(d);
	}
}
