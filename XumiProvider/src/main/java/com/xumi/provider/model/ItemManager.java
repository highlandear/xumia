package com.xumi.provider.model;

public class ItemManager {
	public static ItemManager getInstance() {
		return instance;
	}

	private static ItemManager instance = new ItemManager();
	java.util.Map<String, MagData> items = new java.util.HashMap<String, MagData>();


	String[] paths = { "https://alifei03.cfp.cn/creative/vcg/800/new/VCG21gic19712069-ZGG.jpg",
			"https://c-ssl.duitang.com/uploads/item/201510/31/20151031151335_xRwzJ.gif",
			"https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg" };

	public void load() {
		this.add(new MagData("1", paths[0], ""));
		this.add(new MagData("2", paths[1], ""));
		this.add(new MagData("3", paths[2], ""));
	}
	

	public void add(MagData d) {
		items.put(d.id, d);
	}

	java.util.List<MagData> getMagList() {
		java.util.List<MagData> list = new java.util.ArrayList<MagData>();
		list.addAll(items.values());

		return list;
	}
	
	MagData get(String id) {
		return items.get(id);
	}
}
