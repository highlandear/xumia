package com.xumi.provider.model.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.xumi.provider.model.json.JsonObj;
import com.xumi.provider.model.magz.CertiPass;
import com.xumi.provider.model.nft.NFTData;

/**
 * 基本用户数据示例
 * @author
 *
 */
public class UserData {
	
	public UserData() {}
	
	public String toJson(){
		return JsonObj.toJson(this);
	}
	
		
	public java.util.List<NFTData> getMyNft(String type){
		System.out.println(type);
		if(type.isEmpty())
			return mynfts;
		
		java.util.List<NFTData> res = new java.util.ArrayList<NFTData>();
		mynfts.forEach(e->{
			//if(e.getType().equals(type)) {
			//	res.add(e);
			//}
		});
		
		return res;
	}
	
	public UserData addNft(NFTData n) {
		this.mynfts.add(n);
		return this;
	}
	
	@JsonIgnore
	java.util.List<NFTData> mynfts = new java.util.ArrayList<NFTData>();
	
	// did，未来链ID
	@JsonProperty(value = "token")
	String token;
}
