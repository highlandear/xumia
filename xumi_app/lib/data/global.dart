import 'dart:convert';
import '../bean/deliverdata.dart';
import '../bean/gnftdata.dart';
import '../bean/certipass.dart';
import '../bean/userinfo.dart';
import '../utils/xhttp.dart';
import '../utils/xstorage.dart';
import 'config.dart';

class Global {
  static final Global _instance = Global();
  static Global get user => _instance;

  UserInfo info = UserInfo();
  DeliverData house = DeliverData();

  loadMe() {
    // AStorage.getv('me').then((value) => {
    //       info =
    //           null == value ? UserInfo() : UserInfo.fromJson(jsonDecode(value))
    //     });
  }

  logout() {
    info = UserInfo();
    house = DeliverData();
  }

  Future loadMagData() async {
    return CertiPass.listfromJson(await XHttp.instance
        .post(Config.magazine, params: {'username': info.phoneid}));
  }

  /**
   * 请求登录
   * 返回token
   */
  reqLogin(username, password, {success, fail}) {
    XHttp.instance.post(Config.postlogin, params: {
      'phone_number': username,
      'password': password,
      'userType': 0,
      'grant_type': 'sms_captcha',
    }).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        info.token = val['data']['token'];
        info.phoneid = username;

        XHttp.instance.setHeaders('XUMI-TOKEN', 'Bearer ${info.token}');
        success();
      } else {
        fail(erode);
      }
    });
  }

  /**
   * 购买通证,无物品
   */
  reqBuyItem(itemid, {success, fail}) {
    XHttp.instance.postData(Config.buyItem, params: {'id': itemid}).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        success();
      } else {
        fail();
      }
    });
  }

  /**
   * 加载画廊信息
   */
  Future loadGalleryData() async {
    return GNFTData.listfromJson(
        await XHttp.instance.post(Config.getMyData, params: {'type': 1}));
  }

  reqMyData(datatype, {success, fail}) {
    XHttp.instance
        .post(Config.getMyData, params: {'type': datatype}).then((val) {
      var erode =val['code'];
      if (erode == 200) {
        success(val);
      } else {
        fail(erode);
      }
    });
  }

  reqMyAddress({success, fail}) {
    XHttp.instance
        .get(Config.myAddress, params: {'username': info.phoneid}).then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        house = DeliverData.fromJson(jsonDecode(val)['data']);
        success();
      } else {
        fail();
      }
    });
  }

  reqSendMeItem2NewAddress(where, itemid, {success, fail}) {
    XHttp.instance
        .postData(Config.buyItem2NewAddress,
            params: {'username': info.phoneid, 'itemid': itemid}, data: where)
        .then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        house = DeliverData.fromJson(jsonDecode(val)['data']);
        success();
      } else {
        fail();
      }
    });
  }

  reqAddNewAddress(where, {success, fail}) {
    XHttp.instance
        .postData(Config.addNewAddress,
            params: {'username': info.phoneid}, data: where)
        .then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        house = DeliverData.fromJson(jsonDecode(val)['data']);
        success();
      } else {
        fail();
      }
    });
  }
}
