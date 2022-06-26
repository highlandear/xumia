package com.xumi.provider.model.magz;

import com.xumi.provider.model.json.JsonObj;

public class Magazine {

	static String[] paths = { "https://cognitivelab.net/imgs/a.jpg",
			"https://cognitivelab.net/imgs/b.jpg",
			"https://cognitivelab.net/imgs/d.jpg",
			"https://cognitivelab.net/imgs/c.jpg" };


	public void load() {
		CertiPass c1 = ProductPass.create("1", paths[0], "注册就送数字藏品，边顶产品邮寄到家", "边顶");
		CertiPass c2 = ProductPass.create("2", paths[1], "买就送秋秋的数字艺术品", "秋秋");
		CertiPass c3 = ProductPass.create("3", paths[2], "送秋秋的数字艺术品", "边顶");
		CertiPass c4 = TicketPass.create("4", paths[3], "边顶大会线下门票,限100张", "边顶");
		
		NFTData nft = NFTData.create("https://c-ssl.dtstatic.com/uploads/item/201901/23/20190123094358_agiqu.thumb.1000_0.jpg");
		c1.with(nft);
		
		add(c1).add(c2).add(c3);
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
	
	public static Magazine getInstance() {return instance;}
	private static Magazine instance = new Magazine();
	java.util.Map<String, CertiPass> passes = new java.util.HashMap<String, CertiPass>();
	
	public static void main(String [] argv) {
		
		CertiPass c1 = ProductPass.create("1", paths[0], "注册就送数字藏品，边顶产品邮寄到家", "边顶");
		CertiPass c2 = ProductPass.create("2", paths[1], "买就送秋秋的数字艺术品", "秋秋");
		CertiPass c3 = TicketPass.create("3", paths[2], "边顶大会线下门票,限100张", "边顶");
		
		System.out.println(JsonObj.toJson(c1));
	}
}

