package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 门票
 * @author ledo
 *
 */
public class Ticket extends NFTData {
	
	public static Ticket create(int d) {
		return new Ticket(d);
	}

	private Ticket(int data) {super(data);}

	@Override
	public int getType() {		
		return 3;
	}

}