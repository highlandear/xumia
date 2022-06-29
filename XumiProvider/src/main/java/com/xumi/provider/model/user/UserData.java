package com.xumi.provider.model.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.xumi.provider.model.json.JsonObj;
import com.xumi.provider.model.magz.CertiPass;

public class UserData {
	
	public UserData(String tel, String did){
		this.tel = tel;
		this.did = did;
	}	
	
	public UserData() {}
	
	public String toJson(){
		return JsonObj.toJson(this);
	}
	
	public boolean buy(CertiPass pass) {
		
		return true;
	}
	
	@JsonIgnore
	
	
	@JsonProperty(value = "mainID")
	String tel;
	
	@JsonProperty(value = "did")
	String did;
	
	@JsonProperty(value = "token")
	String token;
}
