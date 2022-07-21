package com.xumi.provider.model.nft;

/**
 * 会员卡
 * @author
 *
 */
public class Membership extends NFTData {

	Membership(int data) {
		super(data);
	}

	@Override
	public int getType() {
		return 2;
	}

}
