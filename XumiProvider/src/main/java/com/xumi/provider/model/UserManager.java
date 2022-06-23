package com.xumi.provider.model;

import java.util.List;

public class UserManager {

	public static UserManager getInstance() {
		return instance;
	}
	private static UserManager instance = new UserManager();

	private java.util.Map<String, UserData> users = new java.util.HashMap<String, UserData>();
	private java.util.Map<String, DeliverData> delivers = new java.util.HashMap<String, DeliverData>();
	java.util.Map<String, MagData> useritems = new java.util.HashMap<String, MagData>();


	public DeliverData getAddr(String un) {
		return delivers.get(un);
	}

	public void addAddr(String userid, DeliverData u) {
		delivers.put(userid, u);
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
		
		DataBean<List<MagData>> ret = new DataBean<>();
		ret.add(MagManager.getInstance().getMagList());

		return ret.toJson();
	}

	public void addItem(String id) {
		useritems.put(id, MagManager.getInstance().get(id));
	}
/*
	public String getMyGalleryJson(String username) {
		
		java.util.List<MagData> list = new java.util.ArrayList<MagData>();
		list.addAll(useritems.values());
		
		DataBean<List<MagData>> ret = new DataBean<>();
		ret.add(list);
		
		return ret.toJson();
	}
*/
	public String getMyDataJson(String username, String datatype) {
		java.util.List<MagData> list = new java.util.ArrayList<MagData>();
		list.addAll(useritems.values());
		
		DataBean<List<MagData>> ret = new DataBean<>();
		ret.add(list);
		
		return ret.toJson();
	}
}
