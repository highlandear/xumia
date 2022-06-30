package com.xumi.provider.model.nft;

/**
 * NFT艺术品
 * @author
 *
 */
public class Artwork extends NFTData{
	
	public static Artwork create(String d) {
		return new Artwork(d);
	}

	private Artwork(String data) {super(data);}

	@Override
	public String getType() {		
		return "art";
	}
	
}
