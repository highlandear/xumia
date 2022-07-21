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
      'userType':0,
      'grant_type': 'sms_captcha',
    }).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        info.token = val['data']['token'];
        info.phoneid = username;
        success();
      } else {
        fail(erode);
      }
    });
  }

  Future loadGalleryData() async {
    return GNFTData.listfromJson(await XHttp.instance.get(Config.getMyData,
        params: {'username': info.phoneid, 'datatype': 'art'}));
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

  reqBuyItem(itemid, {success, fail}) {
    XHttp.instance.postData(Config.buyItem,
        params: {'username': info.phoneid, 'itemid': itemid}).then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
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



  reqMyData(datatype, {success, fail}) {
    XHttp.instance.get(Config.getMyData,
        params: {'username': info.phoneid, 'datatype': datatype}).then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        success(val);
      } else {
        fail(erode);
      }
    });
  }
}
