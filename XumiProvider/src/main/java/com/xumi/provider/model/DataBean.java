package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DataBean<T> {
	public DataBean(){}
//	public DataBean(String s){this.status = s;}
	
	@JsonProperty(value = "status")
	String status;
	
	@JsonProperty(value = "data")
	T data;
		
	
	public String toJson() {
		return JsonObj.toJson(this);
	}
	
	public void add(T d) {
		
		status = d == null ? "1":"0";
		
		data = d ;
	}
}
