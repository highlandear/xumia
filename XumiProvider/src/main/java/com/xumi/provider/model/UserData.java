package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserData {
	
	public UserData(String tel, String did){
		this.tel = tel;
		this.did = did;
	}	
	
	public UserData() {}
	
	public String toJson(){
		return JsonObj.toJson(this);
	}
	
	@JsonProperty(value = "tel")
	String tel;
	
	@JsonProperty(value = "did")
	String did;
	
	@JsonProperty(value = "token")
	String token;
}
