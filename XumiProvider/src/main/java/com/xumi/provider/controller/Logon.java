package com.xumi.provider.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xumi.provider.model.DataBean;
import com.xumi.provider.model.DeliverData;
import com.xumi.provider.model.UserData;
import com.xumi.provider.model.UserManager;

@RestController
@EnableAutoConfiguration
public class Logon {
	  static final String indexReq = "index.action";
	  static final String signReq = "sign.action";
	  static final String postAddr = "postaddr.action";
	  static final String reqAddr = "reqaddr.action";
	  static final String galleryReq = "gallery.action";
	  
	@RequestMapping(value = indexReq, method = RequestMethod.GET)
	public String index(HttpServletRequest request) {

		String username = request.getParameter("username");
		return UserManager.getInstance().getMyMagazineJson(username);
	}

	@RequestMapping(value = galleryReq, method = RequestMethod.GET)
	public String gallery(HttpServletRequest request) {
		String username = request.getParameter("username");
		return UserManager.getInstance().getMyGalleryJson(username);
	}

	@RequestMapping(value = signReq, method = RequestMethod.POST)
	public String register(@RequestParam("username") String username, @RequestParam("password") String password) {
		System.out.println("username is:" + username);
		System.out.println("password is:" + password);
		UserData u = UserManager.getInstance().careatUser(username, password);

		DataBean<UserData> res = new DataBean<UserData>();
		res.add(u);

		return res.toJson();
	}

	/**
	 * user post address data, if post an "itemid" then
	 * this is a purchase action 
	 */
	@RequestMapping(value = postAddr, method = RequestMethod.POST)
	public String sendMyaddr(@RequestParam("username") String username, @RequestParam("itemid") String itemid,
			@RequestBody DeliverData user) {

		System.out.println(username);
		System.out.println(itemid);
		System.out.println(user.getTel());
		System.out.println(user.getName());
		System.out.println(user.getAddress());
		System.out.println(user.getDetail());

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		res.add(user);

		return res.toJson();
	}
	
	@RequestMapping(value = reqAddr, method = RequestMethod.GET)
	public String reqAddr(@RequestParam("username") String username) {

		System.out.println(username);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		DeliverData d = UserManager.getInstance().getAddr(username);
		res.add(d);

		return res.toJson();
	}
}
