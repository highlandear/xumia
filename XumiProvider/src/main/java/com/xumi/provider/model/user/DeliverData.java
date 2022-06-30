package com.xumi.provider.model.user;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DeliverData {
	DeliverData(){}
	
	public String getTel() {return this.tel;}
	
	public String getName() {return this.name;}
	
	public String getAddress() {return this.address;}
	
	public String getDetail() {return this.detail;}
	
	@JsonProperty("tel")
	String tel;
	
	@JsonProperty("name")
	String name;
	
	@JsonProperty("address")
	String address;
	
	@JsonProperty("detail")
	String detail;
	
}
