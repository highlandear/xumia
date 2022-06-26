package com.xumi.provider.model.magz;

/**
 * 附带产品的通证，买产品送NFT
 * @author yuqi
 *
 */
public class ProductPass extends CertiPass {
	public static ProductPass create(String i, String p, String d, String o) {
		return new ProductPass(i,p,d,o);
	}

	private ProductPass(String i, String p, String d, String o){
		super(i,"product", p,d,o);
	}

}
