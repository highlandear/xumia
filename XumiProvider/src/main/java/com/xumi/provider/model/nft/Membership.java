package com.xumi.provider.model.nft;

/**
 * 会员卡
 * @author
 *
 */
public class Membership extends NFTData {

	Membership(String data) {
		super(data);
	}

	@Override
	public String getType() {
		return "member";
	}

}
