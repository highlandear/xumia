package com.xumi.provider.model;

import java.util.List;

import com.xumi.provider.model.json.DataBean;
import com.xumi.provider.model.mag.MagAsset;
import com.xumi.provider.model.mag.MagData;
import com.xumi.provider.model.mag.MagManager;
import com.xumi.provider.model.user.UserData;

public class UManager {




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

	public boolean buyFromMag(String magid) {
		MagData d = MagManager.getInstance().get(magid);
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
	}
	
	public static UManager getInstance() {return instance;}
	private static UManager instance = new UManager();
	private java.util.Map<String, UserData> users = new java.util.HashMap<String, UserData>();
	private java.util.Map<String, DeliverData> delivers = new java.util.HashMap<String, DeliverData>();
	java.util.List<MagAsset> myassets = new java.util.ArrayList<MagAsset>();
}
