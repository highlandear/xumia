package com.xumi.provider.model.nft;

/**
 * NFT艺术品
 * @author
 *
 */
public class Artwork extends NFTData{
	
	public static Artwork create(int d) {
		return new Artwork(d);
	}

	private Artwork(int id) {super(id);}

	@Override
	public int getType() {		
		return 1;
	}
	
}
