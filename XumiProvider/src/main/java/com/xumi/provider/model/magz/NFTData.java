package com.xumi.provider.model.magz;

public class NFTData {
	
	static NFTData create(String p) {return new NFTData(p);}
	
	private NFTData(String p) {this.path = p;}
	
	String path;
}
