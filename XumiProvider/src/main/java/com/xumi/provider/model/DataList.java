package com.xumi.provider.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DataList<T> {
	DataList(){}
	DataList(String s){}
	
	@JsonProperty(value = "status")
	String status;
	
	@JsonProperty(value = "data")
	java.util.List<T> data = new java.util.ArrayList<T>();
		
	
	public String toJson() {
		return JsonObj.toJson(this);
	}
	/*
	
	public void add(T d) {
		data.add(d);
		status = data.isEmpty() ? "1" : "0";
	}
	*/
	
	public void setList(List<T> list) {
		data = list;
	}
}
