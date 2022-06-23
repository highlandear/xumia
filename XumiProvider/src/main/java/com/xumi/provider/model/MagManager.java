package com.xumi.provider.model;

public class MagManager {



	String[] paths = { "https://alifei03.cfp.cn/creative/vcg/800/new/VCG21gic19712069-ZGG.jpg",
			"https://c-ssl.duitang.com/uploads/item/201510/31/20151031151335_xRwzJ.gif",
			"https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg" };
	
	
	MagItem [] m = {new MagBonus(),
			new MagArtCollection(),
			new MagTicket(),
			new MagHomeItem(),
			new MagMembership()};
	

	public void load() {
		this.add(new MagData("1", paths[0], "ad", "注册就送数字藏品，边顶产品邮寄到家", "边顶").addItem(m[0]).addItem(m[1]));
		this.add(new MagData("2", paths[1], "买就送秋秋的数字艺术品","秋秋").addItem(m[0]));
		this.add(new MagData("3", paths[2], "边顶大会线下门票","广彬").addItem(m[2]));
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
	
	
	public static MagManager getInstance() {return instance;}
	private static MagManager instance = new MagManager();
	java.util.Map<String, MagData> mags = new java.util.HashMap<String, MagData>();
}
