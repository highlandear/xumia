package com.xumi.provider.model.user;

import com.xumi.provider.model.json.DataBean;
import com.xumi.provider.model.magz.CertiPass;
import com.xumi.provider.model.magz.Magazine;

public class UserManager {

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
		
		DataBean<java.util.List<CertiPass>> ret = new DataBean<>();
		
		ret.add(Magazine.getInstance().getPassesList());

		System.out.println("==========" + ret.toJson());
		return ret.toJson();
	}

	public boolean buyFromMag(String magid) {
		CertiPass d = Magazine.getInstance().get(magid);
		
		if(d == null)
		{
			System.out.println("xxx");
			return false;
		}
		
	//	myassets.addAll(d.assets);
	//	System.out.println(d.desc);
		return true;
	}

	public String getMyDataJson(String username, String datatype) {
		/*
		DataBean<java.util.List<MagAsset>> res = new DataBean<>();
		java.util.List<MagAsset> list = new java.util.ArrayList<MagAsset>();
		myassets.forEach(e->{
			if(datatype.equals(e.tocken())) {
				list.add(e);
			}
			
		});
	
		res.add(list);
		System.out.println(res.toJson());
		return res.toJson();
		*/
		return "";
	}
	
	public static UserManager getInstance() {return instance;}
	private static UserManager instance = new UserManager();
	
	private java.util.Map<String, UserData> users = new java.util.HashMap<String, UserData>();
}

