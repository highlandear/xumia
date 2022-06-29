package com.xumi.provider.model.nft;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Ticket extends NFTData {
	
	public static Ticket create(String d) {
		return new Ticket(d);
	}

	private Ticket(String data) {super(data);}

	@Override
	public String getType() {		
		return "ticket";
	}
	
	@JsonIgnore
	NFTData others;

}