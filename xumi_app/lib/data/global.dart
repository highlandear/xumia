import 'dart:convert';

import '../bean/useraddr.dart';
import '../bean/gnftdata.dart';
import '../bean/certipass.dart';
import '../bean/userinfo.dart';
import '../utils/xhttp.dart';
import '../utils/xstorage.dart';
import 'config.dart';

class Global {
  static final Global _instance = Global();
  static Global get user => _instance;

  UserInfo _info = UserInfo();
  List<AddressInfo> _addressList = [];

  //UserInfo _info = UserInfo(phoneID: '123748484', token: 'abcdeflsla');

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
        element.ismain = true;
        return element;
      }
    }
    _addressList.first.ismain = true;
    return _addressList.first;
  }

  getPhone() => _info.phoneID;

  online() => _info.token.isNotEmpty;

  hasAddress() => _addressList.isNotEmpty;

  getAddressList() => _addressList;

  /// 加载杂志页面
  Future loadMagData() async {
    return CertiPass.listfromJson(await XHttp.instance
        .post(Config.magazine, params: {'username': _info.phoneID}));
  }

  /// 加载画廊信息
  Future loadGalleryData() async {
    return GNFTData.listfromJson(
        await XHttp.instance.post(Config.getMyData, params: {'type': 1}));
  }

  /// 请求登录
  /// 返回token
  /// 登录成功后继续请求收货地址
  reqLogin(username, password, {success, fail}) {
    XHttp.instance.post(Config.postlogin, params: {
      'phone_number': username,
      'password': password,
      'userType': 0,
      'grant_type': 'sms_captcha',
    }).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        _info.token = val['data']['token'];
        _info.phoneID = username;
        //  XHttp.instance.setHeaders('XUMI-TOKEN', 'Bearer ${_info.token}');
        XHttp.instance.setToken2Headears(_info.token);
        _localSaveUserInfo();
        // 登录成功后就请求已经存储的地址信息
        _reqAddressList(success: () {}, fail: () {});

        // 向调用者回调
        success();
      } else {
        fail(erode);
      }
    });
  }

  /// 请求所有的邮寄地址信息
  _reqAddressList({success, fail}) {
    XHttp.instance.post(Config.getallmyAddress).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        _addressList = AddressInfo.listfromJson(val['data']);
        success();
      } else {
        fail();
      }
    });
  }

  /// 购买通证,
  /// itemid, 通证id
  /// aid,地址id
  reqBuyItem(itemid, aid, {success, fail}) {
    XHttp.instance.post(Config.buyItem,
        params: {'id': itemid, 'addressId': aid}).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        success();
      } else {
        fail();
      }
    });
  }

  /// 请求某类NFT
  reqMyData(datatype, {success, fail}) {
    XHttp.instance
        .post(Config.getMyData, params: {'type': datatype}).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        success(val);
      } else {
        print('$erode, ${val['msg']}');
        fail(erode);
      }
    });
  }

  /// 创建或更新地址
  reqUpdateAddress(where, {success, fail}) {
    XHttp.instance.postData(Config.updateAddress, data: where).then((val) {
      var erode = val['code'];
      if (erode == 200) {
        AddressInfo address = AddressInfo.fromJson(val['data']);
        _updateAddressList(address);
        success();
      } else {
        fail();
      }
    });
  }

  _updateAddressList(AddressInfo address) {
    for (var element in _addressList) {
      if (element.id == address.id) {
        element = address;
        return;
      }
    }
    _addressList.add(address);
  }

  _localSaveUserInfo() {
    XStorage.save('userinfo', jsonEncode(_info.toJson()));
  }

  _loadLocalUserInfo({success, fail}) {
    XStorage.get('userinfo').then((value) {
      if (value == null) {
        return fail();
      }

      _info = UserInfo.fromJson(jsonDecode(value));
      return success();
    });
  }

  autoLogin() {
    _loadLocalUserInfo(success: () {
      if (_info.phoneID.isEmpty) return;
      if (_info.token.isNotEmpty) {
        // 登录状态，有token
        XHttp.instance.setToken2Headears(_info.token);
      } else {
        // 没有token,此前是主动登出，那么进行自动 登录
        reqLogin(_info.phoneID, '', success: () {}, fail: (value) {
      //    print('登录失败');
        });
      }
    }, fail: () {
    //  print('本地无用户');
    });
  }

  logout() {
    _info.token = '';

    _addressList = [];

    _localSaveUserInfo();
  }
}
