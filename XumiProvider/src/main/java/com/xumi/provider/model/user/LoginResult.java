package com.xumi.provider.model.user;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xumi.provider.model.json.JsonObj;

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
