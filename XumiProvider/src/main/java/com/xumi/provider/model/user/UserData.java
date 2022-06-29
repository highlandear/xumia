package com.xumi.provider.model.user;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.xumi.provider.model.json.JsonObj;
import com.xumi.provider.model.magz.CertiPass;
import com.xumi.provider.model.nft.NFTData;

public class UserData {
	
	public UserData(String tel, String did){
		this.tel = tel;
		this.did = did;
	}	
	
	public UserData() {}
	
	public String toJson(){
		return JsonObj.toJson(this);
	}
	
	public boolean buy(CertiPass pass) {
		this.mynfts.add(pass.getNft());
		return true;
	}
	
	public java.util.List<NFTData> getMyNft(String type){
		System.out.println(type);
		if(type.isEmpty())
			return mynfts;
		
		java.util.List<NFTData> res = new java.util.ArrayList<NFTData>();
		mynfts.forEach(e->{
			if(e.getType().equals(type)) {
				res.add(e);
			}
		});
		
		return res;
	}
	
	public UserData addNft(NFTData n) {
		this.mynfts.add(n);
		return this;
	}
	
	@JsonIgnore
	java.util.List<NFTData> mynfts = new java.util.ArrayList<NFTData>();
	
		
	@JsonProperty(value = "mainID")
	String tel;
	
	@JsonProperty(value = "did")
	String did;
}
