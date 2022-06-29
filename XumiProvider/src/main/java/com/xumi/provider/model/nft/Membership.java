package com.xumi.provider.model.nft;

public class Membership extends NFTData {

	Membership(String data) {
		super(data);
	}

	@Override
	public String getType() {
		return "member";
	}

}
