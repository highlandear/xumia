package com.xumi.provider.model;

public class UserManager {

	public static UserManager getInstance() {
		return instance;
	}
	private static UserManager instance = new UserManager();

	private java.util.Map<String, UserData> users = new java.util.HashMap<String, UserData>();
	private java.util.Map<String, DeliverData> delivers = new java.util.HashMap<String, DeliverData>();


	public DeliverData getAddr(String un) {
		return delivers.get(un);
	}

	public void addAddr(String key, DeliverData u) {
		delivers.put(key, u);
	}	


	/**
	 * 
	 * @param tel send
	 * @param pw: validator number from SMS
	 * @return
	 */
	public UserData careatUser(String key, String pw) {

		UserData u = users.get(key);
		if(u == null)
				u = new UserData(key, genDID());

		this.add(key, u);

		return u;
	}

	public boolean check(String un, String pw) {

		return true;
	}

	public UserData get(String un) {
		return users.get(un);
	}

	private void add(String k, UserData u) {
		users.put(k, u);
	}

	private String genDID() {
		return "0x2d7f34a863421";
	}

	public String getMyMagazineJson(String username) {

		DataList<MagData> res = new DataList<MagData>("1");

		res.add(new MagData("https://alifei03.cfp.cn/creative/vcg/800/new/VCG21gic19712069-ZGG.jpg", ""));
		res.add(new MagData("https://c-ssl.duitang.com/uploads/item/201510/31/20151031151335_xRwzJ.gif", ""));
		res.add(new MagData("https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg", ""));

		return res.toJson();
	}

	public String getMyGalleryJson(String username) {

		DataList<MagData> res = new DataList<MagData>("1");

		res.add(new MagData("http://file03.16sucai.com/2016/06/20165rd2yvmc025.jpg", ""));
		res.add(new MagData("https://alifei03.cfp.cn/creative/vcg/800/new/VCG21gic19712069-ZGG.jpg", ""));
		res.add(new MagData("https://c-ssl.duitang.com/uploads/item/201510/31/20151031151335_xRwzJ.gif", ""));
		res.add(new MagData("http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png", ""));
		res.add(new MagData("http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png", ""));
		res.add(new MagData("http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png", ""));
		res.add(new MagData("http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png", ""));
		res.add(new MagData("https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg", ""));

		return res.toJson();
	}

}
