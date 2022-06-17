import 'dart:convert';
import '../bean/deliverdata.dart';
import '../bean/nftdata.dart';
import '../bean/userinfo.dart';
import '../utils/xhttp.dart';
import '../utils/xlocalstorage.dart';
import 'config.dart';

class Global {
  static final Global _instance = Global();
  static Global get mydata => _instance;

  UserInfo me = UserInfo();
  DeliverData house = DeliverData();

  loadMe() {
    AStorage.getv('me').then((value) => {
          me = null == value ? UserInfo() : UserInfo.fromJson(jsonDecode(value))
        });
  }

  logout() => me = UserInfo();

  Future loadMagData() async {
    return NFTData.listfromJson(
        await XHttp.instance.get(Config.indexReq, params: {'username': me.did}));
  }

  Future loadGalleryData() async {
    return NFTData.listfromJson(
        await XHttp.instance.get(Config.galleryReq, params: {'username': me.did}));
  }

  Future loadAddressData() async {
    return DeliverData.fromJson(
        await XHttp.instance.get(Config.reqAddr, params: {'username': me.tel}));
  }
}
