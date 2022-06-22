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
	  static final String magzine = "magazine";
	  static final String login = "login";
	  static final String addNewAddress = "addNewAddress";
	  static final String myAddress = "myAddress";
	  static final String buyItem2NewAddress = "buyItem2NewAddress";
	  static final String buyItem ="buyItem";
	  static final String getMyData="getMyData";

	@RequestMapping(value = magzine, method = RequestMethod.GET)
	public String index(HttpServletRequest request) {

		String username = request.getParameter("username");
		return UserManager.getInstance().getMyMagazineJson(username);
	}

	@RequestMapping(value = getMyData, method = RequestMethod.GET)
	public String getMyData(HttpServletRequest request) {
		String username = request.getParameter("username");
		String datatype = request.getParameter("datatype");
		
		return UserManager.getInstance().getMyDataJson(username, datatype);
	//	return UserManager.getInstance().getMyGalleryJson(username);
	}
	

	@RequestMapping(value = login, method = RequestMethod.POST)
	public String register(@RequestParam("username") String username, @RequestParam("password") String password) {
		System.out.println("username is:" + username);
		System.out.println("password is:" + password);
		UserData u = UserManager.getInstance().careatUser(username, password);

		DataBean<UserData> res = new DataBean<UserData>();
		res.add(u);

		return res.toJson();
	}

	@RequestMapping(value = buyItem, method = RequestMethod.POST)
	public String sendItem2me(@RequestParam("username") String username, @RequestParam("itemid") String itemid) {

		System.out.println(username);
		System.out.println(itemid);
		
		UserManager.getInstance().addItem(itemid);

		DataBean<?> res = new DataBean<>("0");
		return res.toJson();
	}
	
	@RequestMapping(value = buyItem2NewAddress, method = RequestMethod.POST)
	public String sendItem2NewAddress(@RequestParam("username") String username, @RequestParam("itemid") String itemid,
			@RequestBody DeliverData user) {

		System.out.println(username);
		System.out.println(itemid);
		System.out.println(user.getTel());
		System.out.println(user.getName());
		System.out.println(user.getAddress());
		System.out.println(user.getDetail());
		
		UserManager.getInstance().addAddr(username, user);
		UserManager.getInstance().addItem(itemid);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		res.add(user);

		return res.toJson();
	}
	
	@RequestMapping(value = addNewAddress, method = RequestMethod.POST)
	public String addNewAddress(@RequestParam("username") String username, @RequestBody DeliverData user) {

		System.out.println(username);
		System.out.println(user.getTel());
		System.out.println(user.getName());
		System.out.println(user.getAddress());
		System.out.println(user.getDetail());
		
		UserManager.getInstance().addAddr(username, user);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		res.add(user);
	

		return res.toJson();
	}

	@RequestMapping(value = myAddress, method = RequestMethod.GET)
	public String reqAddr(@RequestParam("username") String username) {

		System.out.println(username);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		DeliverData d = UserManager.getInstance().getAddr(username);
		res.add(d);

		return res.toJson();
	}
}
