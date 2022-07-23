package com.xumi.provider.model.user;

import com.xumi.provider.model.json.DataBean;
import com.xumi.provider.model.magz.CertiPass;
import com.xumi.provider.model.magz.Magazine;
import com.xumi.provider.model.nft.NFTData;

/**
 * 用户数据的模拟管理
 * @author
 *
 */
public class UserManager {

	public UserData careatUser(String key, String pw) {

		UserData u = users.get(key);
		if (u == null)
			u = new UserData();
		u.token = this.genDID();

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

	//	ret.add(Magazine.getInstance().getPassesList());

	//	System.out.println("==========" + ret.toJson());
		return ret.toJson();
	}


	public String getMyDataJson(String username, String datatype) {
		UserData user = users.get(username);
		if(user == null ) {
			return "error";
		}
		
		DataBean<java.util.List<NFTData>> res = new DataBean<>();
		res.add(user.getMyNft(datatype));
		
		return res.toJson();
	}

	public DeliverData getAddr(String un) {
		return delivers.get(un);
	}

	public void addAddr(String userid, DeliverData u) {
		delivers.put(userid, u);
	}

	public static UserManager getInstance() {
		return instance;
	}

	private static UserManager instance = new UserManager();

	private java.util.Map<String, UserData> users = new java.util.HashMap<String, UserData>();

	private java.util.Map<String, DeliverData> delivers = new java.util.HashMap<String, DeliverData>();
}
