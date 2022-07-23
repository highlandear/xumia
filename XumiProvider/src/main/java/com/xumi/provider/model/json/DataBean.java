package com.xumi.provider.model.json;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DataBean<T> {
	
	public DataBean(){}
	
//	public DataBean(){}
	
	@JsonProperty(value = "code")
	int code = 200;
	
	@JsonProperty(value = "data")
	T data;
		
	
	public String toJson() {
		return JsonObj.toJson(this);
	}
	
	public void add(T d) {
		
		data = d ;
	}
}
