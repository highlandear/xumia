package com.xumi.provider.model.magz;

import com.xumi.provider.model.nft.Artwork;
import com.xumi.provider.model.nft.NFTData;
import com.xumi.provider.model.nft.Ticket;

/**
 * 杂志主页示例
 * @author
 *
 */
public class Magazine {

	static String[] paths = { 
			"http://cognitivelab.net/imgs/a.jpg", // 烟斗
			"http://cognitivelab.net/imgs/d.jpg", //兔子 
			
			"http://cognitivelab.net/imgs/b.jpg", // 以下几个是边顶产品的信息图
			"http://cognitivelab.net/imgs/c.jpg", //
			"http://cognitivelab.net/imgs/e.jpg",
			"http://cognitivelab.net/imgs/f.jpg", 
			
			"https://img.alicdn.com/imgextra/i3/2209380674403/O1CN01CxRGs01iOcX7EnYlv_!!2209380674403.jpg", //喜马拉雅
			};
	
	// 几个长图，用于介绍产品信息
	static String [] details = {
			"https://img.alicdn.com/imgextra/i4/2209380674403/O1CN01D0B3cA1iOcX1cx4vT_!!2209380674403.jpg",
			"https://img10.360buyimg.com/cms/jfs/t1/182872/6/133/795112/607f3495Ea178190e/01c683a879c788c5.jpg"};

	// 附加的可购买产品的标识
	static String [] products = {"bd-16","bd-17"};
/*	
	// 几个NFT示例
	static NFTData [] nfts = {
			Artwork.create(paths[0]).addAuthor("秋秋").addCaption("这是秋秋在2016年的作品"),
			Artwork.create(paths[1]).addAuthor("广彬").addCaption("广彬收藏的这是秋秋作品"),
			Ticket.create(paths[6]).addAuthor("边顶").addCaption("边顶线下峰会门票"),
			};

	public void load() {
		CertiPass c1 = CertiPass.create("1", paths[2], "注册就送数字藏品，边顶产品邮寄到家", details[0], "边顶", "￥20.00");
		CertiPass c2 = CertiPass.create("2", paths[3], "买就送秋秋的数字艺术品", details[1], "秋秋","￥30.00");
		CertiPass c3 = CertiPass.create("3", paths[4], "送秋秋的数字艺术品", "", "边顶", "￥50.00");
		CertiPass c4 = CertiPass.create("4", paths[5], "边顶大会线下门票,限100张", "", "边顶", "￥200.00");

		c1.with(products[0]);
		c1.with(nfts[0]);
		c2.with(nfts[1]);
		
		c4.with(nfts[2]);		
		
		add(c1).add(c2).add(c3).add(c4);
	}

	public Magazine add(CertiPass d) {
		passes.put(d.id, d);
		return this;
	}

	public java.util.List<CertiPass> getPassesList() {
		java.util.List<CertiPass> list = new java.util.ArrayList<CertiPass>();
		list.addAll(passes.values());
		return list;
	}
	
	public CertiPass get(String id) {return passes.get(id);}
*/	
	public void load() {
	
	}
	public static Magazine getInstance() {return instance;}
	private static Magazine instance = new Magazine();
	java.util.Map<String, CertiPass> passes = new java.util.HashMap<String, CertiPass>();

}

