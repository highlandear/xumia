package com.xumi.provider.model.user;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DeliverData {
	DeliverData(){}
	
	public String getID() {return this.id;}
	
	public String getName() {return this.name;}
	
//	public String getAddress() {return this.address;}
	
	public String getDetail() {return this.detail;}
	
	@JsonProperty("id")
	String id;
	@JsonProperty("id")
	  String desc;
	  String phone;
	  String name;
	  String prov;
	  String city;
	  String dist;
	  String detail;
	  boolean isDefault;
	
}
