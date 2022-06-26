package com.xumi.provider.model.magz;

public class TicketPass extends CertiPass {

	public static TicketPass create(String i, String p, String d, String o) {
		return new TicketPass(i,p,d,o);
	}

	private TicketPass(String i, String p, String d, String o){
		super(i, "ticket", p,d,o);
	}
	
	@Override
	String getType() {
		return "ticket";
	}

}
