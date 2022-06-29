package com.xumi.provider.model.magz;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductData {
	public static ProductData create(String id) {
		return new ProductData(id);
	}
	private ProductData(String id) {
		this.id = id;
	}

	@JsonProperty("id")
	String id;
}
