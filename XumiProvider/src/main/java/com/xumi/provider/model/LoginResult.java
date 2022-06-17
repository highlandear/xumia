package com.xumi.provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class LoginResult {
	
	public LoginResult(int e, UserData d){
		this.err = e;
		this.data = d;
	}
	
	public String toJson() {
		return JsonObj.toJson(this);
	}	
	
	@JsonProperty("errorCode")
	int err;
	
	@JsonProperty("data")
	UserData data;
}
