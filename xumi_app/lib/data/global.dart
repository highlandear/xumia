import 'dart:convert';
import '../bean/deliverdata.dart';
import '../bean/gnftdata.dart';
import '../bean/magdata.dart';
import '../bean/userinfo.dart';
import '../utils/xhttp.dart';
import '../utils/xlocalstorage.dart';
import 'config.dart';

class Global {
  static final Global _instance = Global();
  static Global get user => _instance;

  UserInfo info = UserInfo();
  DeliverData house = DeliverData();

  loadMe() {
    AStorage.getv('me').then((value) => {
          info = null == value ? UserInfo() : UserInfo.fromJson(jsonDecode(value))
        });
  }

  logout() {
    info = UserInfo();
    house = DeliverData();
  }

  Future loadMagData() async {
    return MagData.listfromJson(await XHttp.instance
        .get(Config.magzine, params: {'username': info.did}));
  }

  Future loadGalleryData() async {
    return GNFTData.listfromJson(await XHttp.instance
        .get(Config.getMyData, params: {'username': info.did, 'datatype': 'art'}));
  }

  /*
  Future loadAddressData() async {
    return DeliverData.fromJson(
        await XHttp.instance.get(Config.reqAddr, params: {'username': info.mainID}));
  }

   */

  reqMyAddress({success, fail}) {
    XHttp.instance
        .get(Config.myAddress, params: {'username': info.mainID}).then((val) {
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
            params: {'username': info.mainID, 'itemid': itemid}, data: where)
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

  reqSendItem(itemid, {success, fail}) {
    XHttp.instance
        .postData(Config.buyItem,
        params: {'username': info.mainID, 'itemid': itemid})
        .then((val) {
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
        params: {'username': info.mainID}, data: where)
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

  reqLogin(username, password, {success, fail}) {
    XHttp.instance.post(Config.login, params: {
      'username': username,
      'password': password,
    }).then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        info = UserInfo.fromJson(jsonDecode(val)['data']);
        success();
      } else {
       fail(erode);
      }
    });
  }
}
