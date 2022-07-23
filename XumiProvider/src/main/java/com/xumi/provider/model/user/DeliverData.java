package com.xumi.provider.model.user;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DeliverData {
	DeliverData() {
	}

	public String getID() {
		return this.id;
	}

	public String getName() {
		return this.name;
	}

	public String getDetail() {
		return this.detail;
	}

	@JsonProperty("id")
	String id;
	@JsonProperty("desc")
	String desc;
	@JsonProperty("phone")
	String phone;
	@JsonProperty("name")
	String name;
	@JsonProperty("province")
	String prov;
	@JsonProperty("city")
	String city;
	@JsonProperty("district")
	String dist;
	@JsonProperty("detailedAddress")
	String detail;
	@JsonProperty("default")
	boolean isDefault;

}
