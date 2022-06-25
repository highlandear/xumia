package com.xumi.provider.model;

public class MagManager {

	String[] paths = { "https://alifei03.cfp.cn/creative/vcg/800/new/VCG21gic19712069-ZGG.jpg",
			"https://c-ssl.duitang.com/uploads/item/201510/31/20151031151335_xRwzJ.gif",
			"https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg" };

	MagAsset[] m = { 
			new MagBonus(),
			new MagArt("https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg", "秋秋画作",""), 
			new MagTicket(paths[1],"边顶线下粉丝会"),
			new MagHomeItem(), 
			new MagMembership()
			};

	public void load() {
		this.add(new MagData("1", paths[0], "注册就送数字藏品，边顶产品邮寄到家", "边顶", "ad").addItem(m[0]).addItem(m[1]));
		this.add(new MagData("2", paths[1], "买就送秋秋的数字艺术品", "秋秋").addItem(m[1]));
		this.add(new MagData("3", paths[2], "边顶大会线下门票,限100张", "边顶").addItem(m[2]));
		this.add(new MagData("4", paths[2], "精美生肖家园物品", "边顶",
				"https://www.cognitivelab.net/question.html").addItem(m[3]));
	}

	public void add(MagData d) {
		mags.put(d.id, d);
	}

	java.util.List<MagData> getMagList() {
		java.util.List<MagData> list = new java.util.ArrayList<MagData>();
		list.addAll(mags.values());

		return list;
	}

	MagData get(String id) {
		return mags.get(id);
	}

	public static MagManager getInstance() {
		return instance;
	}

	private static MagManager instance = new MagManager();
	java.util.Map<String, MagData> mags = new java.util.HashMap<String, MagData>();
}
