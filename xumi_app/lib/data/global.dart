import '../bean/useraddr.dart';
import '../bean/gnftdata.dart';
import '../bean/certipass.dart';
import '../bean/userinfo.dart';
import '../utils/xhttp.dart';
import 'config.dart';

class Global {
  static final Global _instance = Global();
  static Global get user => _instance;

  UserInfo _info = UserInfo();
  List<AddressInfo> _addressList = [];

  //UserInfo _info = UserInfo(phoneID: '123748484', token: 'abcdeflsla');
  // List<UserAddress> _addressList = [
  //   UserAddress(
  //       id: 1,
  //       name: 'HZS',
  //       desc: '公司',
  //       phone: '1378288282',
  //       prov: '北京',
  //       city: '北京',
  //       dist: '海淀区',
  //       detail: '学清路18号',
  //       isDefault: true),
  //   UserAddress(
  //       id: 2,
  //       name: '黄作胜',
  //       desc: '我家',
  //       phone: '1378288282',
  //       prov: '北京',
  //       city: '北京',
  //       dist: '海淀区',
  //       detail: '学清路18号',
  //       isDefault: false),
  //   UserAddress(
  //       id: 3,
  //       name: 'toal',
  //       desc: '我家',
  //       phone: '1378288282',
  //       prov: '北京',
  //       city: '北京',
  //       dist: '海淀区',
  //       detail: '学清路18号',
  //       isDefault: false),
  // ];

  getAddressByID(int id) {
    for (var element in _addressList) {
      if (element.id == id) {
        return element;
      }
    }

    return null;
  }

  getDefaultAddress() {
    for (var element in _addressList) {
      if (element.isDefault) {
        return element;
      }
    }
    _addressList.first.isDefault = true;
    return _addressList.first;
  }

  getPhone() => _info.phoneID;

  online() => _info.token.isNotEmpty;

  hasAddress() => _addressList.isNotEmpty;

  getAddressList() => _addressList;

  logout() {
    _info = UserInfo();
    _addressList = [];
  }

  Future loadMagData() async {
    return CertiPass.listfromJson(await XHttp.instance
        .post(Config.magazine, params: {'username': _info.phoneID}));
  }

  /// 请求登录
  /// 返回token
  reqLogin(username, password, {success, fail}) {
    XHttp.instance.post(Config.postlogin, params: {
      'phone_number': username,
      'password': password,
      'userType': 0,
      'grant_type': 'sms_captcha',
    }).then((val) {
      print(val);
      var erode = val['code'];
      print(erode);
      if (erode == 200) {
        _info.token = val['data']['token'];
        _info.phoneID = username;

        XHttp.instance.setHeaders('XUMI-TOKEN', 'Bearer ${_info.token}');
        success();
      } else {
        fail(erode);
      }
    });
  }

  /// 购买通证,无物品
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

  /// 加载画廊信息
  Future loadGalleryData() async {
    return GNFTData.listfromJson(
        await XHttp.instance.post(Config.getMyData, params: {'type': 1}));
  }

  /// 请求某类NFT
  reqMyData(datatype, {success, fail}) {
    XHttp.instance
        .post(Config.getMyData, params: {'type': datatype}).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        success(val);
      } else {
        fail(erode);
      }
    });
  }

  /// 请求所有的邮寄地址信息
  reqMyAddress({success, fail}) {
    XHttp.instance.post(Config.getallmyAddress).then((val) {
      //  print(val);
      var erode = val['code'];
      if (erode == 200) {
        //  house = UserAddress.fromJson(val['data']);
        _addressList = AddressInfo.listfromJson(val['data']);
        success();
      } else {
        fail();
      }
    });
  }

  /// 创建或更新地址
  reqUpdateAddress(where, {success, fail}) {
    XHttp.instance.postData(Config.updateAddress, data: where).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        //  UserAddress ua = UserAddress.fromJson(val['data']);
        //  _addressList.add(ua);
        success();
      } else {
        fail();
      }
    });
  }

  loadMe() {
    // AStorage.getv('me').then((value) => {
    //       info =
    //           null == value ? UserInfo() : UserInfo.fromJson(jsonDecode(value))
    //     });
  }


/*
  reqSendMeItem2NewAddress(where, itemid, {success, fail}) {
    XHttp.instance
        .postData(Config.buyItem2NewAddress,
            params: {'username': _info.phoneID, 'itemid': itemid}, data: where)
        .then((val) {
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        //   house = UserAddress.fromJson(jsonDecode(val)['data']);
        success();
      } else {
        fail();
      }
    });

  }
*/
}
