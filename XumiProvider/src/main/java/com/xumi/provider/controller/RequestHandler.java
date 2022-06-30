
package com.xumi.provider.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xumi.provider.model.json.DataBean;
import com.xumi.provider.model.magz.CertiPass;
import com.xumi.provider.model.magz.Magazine;
import com.xumi.provider.model.user.DeliverData;
import com.xumi.provider.model.user.UserData;
import com.xumi.provider.model.user.UserManager;

@RestController
@EnableAutoConfiguration
public class RequestHandler {
	
	  static final String magzine = "magazine.do";
	  static final String login = "login.do";
	  static final String addNewAddress = "addNewAddress.do";
	  static final String myAddress = "myAddress.do";
	  static final String buyItem2NewAddress = "buyItem2NewAddress.do";
	  static final String buyItem ="buyItem.do";
	  static final String getMyData="getMyData.do";

	@RequestMapping(value = magzine, method = RequestMethod.GET)
	public String magazine(HttpServletRequest request) {

		String username = request.getParameter("username");
	
		return UserManager.getInstance().getMyMagazineJson(username);
	}

	/**
	 * 
	 * @param datatype : gallery,tickets,homeitem,
	 * @return
	 */
	@RequestMapping(value = getMyData, method = RequestMethod.GET)
	public String getMyData(HttpServletRequest request) {
		String username = request.getParameter("username");
		String datatype = request.getParameter("datatype");
	//	System.out.println(UserManager.getInstance().getMyDataJson(username, datatype));
		
		return UserManager.getInstance().getMyDataJson(username, datatype);
	}
	

	@RequestMapping(value = login, method = RequestMethod.POST)
	public String register(@RequestParam("username") String username, @RequestParam("password") String password) {
	//	System.out.println("username is:" + username);
	//	System.out.println("password is:" + password);
		UserData u = UserManager.getInstance().careatUser(username, password);

		DataBean<UserData> res = new DataBean<UserData>();
		res.add(u);

		return res.toJson();
	}

	@RequestMapping(value = buyItem, method = RequestMethod.POST)
	public String buySth(@RequestParam("username") String username, @RequestParam("itemid") String itemid) {
		UserData user = UserManager.getInstance().get(username);
		if(user == null)
			return "error";
		
		CertiPass pass = Magazine.getInstance().get(itemid);

		boolean ok = user.buy(pass);
		
		DataBean<?> res = new DataBean<>(ok? "0":"1");
		return res.toJson();
	}
	
	@RequestMapping(value = buyItem2NewAddress, method = RequestMethod.POST)
	public String sendItem2NewAddress(@RequestParam("username") String username, @RequestParam("itemid") String itemid,
			@RequestBody DeliverData houseInfo) {
/*
		System.out.println(username);
		System.out.println(itemid);
		System.out.println(houseInfo.getTel());
		System.out.println(houseInfo.getName());
		System.out.println(houseInfo.getAddress());
		System.out.println(houseInfo.getDetail());
*/		
		UserManager.getInstance().addAddr(username, houseInfo);
		UserData user = UserManager.getInstance().get(username);
		if(user == null)
			return "error";
		
		CertiPass pass = Magazine.getInstance().get(itemid);
		if(pass == null)
			return "error";
		
		user.buy(pass);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		res.add(houseInfo);

		return res.toJson();
	}
	
	@RequestMapping(value = addNewAddress, method = RequestMethod.POST)
	public String addNewAddress(@RequestParam("username") String username, @RequestBody DeliverData house) {

		/*
		System.out.println(username);
		System.out.println(house.getTel());
		System.out.println(house.getName());
		System.out.println(house.getAddress());
		System.out.println(house.getDetail());
		*/
		UserManager.getInstance().addAddr(username, house);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		res.add(house);
	

		return res.toJson();
	}

	@RequestMapping(value = myAddress, method = RequestMethod.GET)
	public String reqAddr(@RequestParam("username") String username) {

	//	System.out.println(username);

		DataBean<DeliverData> res = new DataBean<DeliverData>();
		DeliverData d = UserManager.getInstance().getAddr(username);
		res.add(d);

		return res.toJson();
	}
}

