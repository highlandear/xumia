package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 门票
 * @author ledo
 *
 */
public class Ticket extends NFTData {
	
	public static Ticket create(String d) {
		return new Ticket(d);
	}

	private Ticket(String data) {super(data);}

	@Override
	public String getType() {		
		return "ticket";
	}
	
	// 可附加的NFT道具等，根据业务情景使用
	@JsonIgnore
	NFTData others;

}