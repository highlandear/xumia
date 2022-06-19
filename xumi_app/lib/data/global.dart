import 'dart:convert';
import '../bean/deliverdata.dart';
import '../bean/nftdata.dart';
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
    return NFTData.listfromJson(await XHttp.instance
        .get(Config.indexReq, params: {'username': info.did}));
  }

  Future loadGalleryData() async {
    return NFTData.listfromJson(await XHttp.instance
        .get(Config.galleryReq, params: {'username': info.did}));
  }

  Future loadAddressData() async {
    return DeliverData.fromJson(
        await XHttp.instance.get(Config.reqAddr, params: {'username': info.tel}));
  }

  reqMyAddress({success, fail}) {
    XHttp.instance
        .get(Config.reqAddr, params: {'username': info.tel}).then((val) {
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
        .postData(Config.reqItem2NewAddr,
            params: {'username': info.tel, 'itemid': itemid}, data: where)
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
        .postData(Config.reqSendItem,
        params: {'username': info.tel, 'itemid': itemid})
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
        params: {'username': info.tel}, data: where)
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
    XHttp.instance.post(Config.signReq, params: {
      'username': username,
      'password': password,
    }).then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        info = UserInfo.fromJson(jsonDecode(val)['data']);
        success();
      } else {
       fail();
      }
    });
  }
}
