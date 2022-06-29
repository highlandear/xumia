package com.xumi.provider.model.nft;

public class Artwork extends NFTData{
	
	public static Artwork create() {
		return new Artwork();
	}

	private Artwork() {super("art");}
}
