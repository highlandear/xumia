import 'dart:convert';
import '../bean/nftdata.dart';
import '../bean/user_info.dart';
import '../utils/xhttp.dart';
import '../utils/xlocalstorage.dart';
import 'config.dart';

class Global {
  static Global _instance = Global();
  static Global get mydata => _instance;

  UserInfo me = UserInfo();

  loadMe() {
    AStorage.getv('me').then((value) => {
          me =
              null == value ? UserInfo() : UserInfo.fromJson(jsonDecode(value)),
        });
  }

  logout() => me = UserInfo();

  Future loadMagData() async {
    return NFTData.listfromJson(
        await XHttp.instance.get(Config.FRESH, params: {'username': me.did}));
  }

  Future loadGalleryData() async{
    return NFTData.listfromJson(
        await XHttp.instance.get(Config.GALLERY, params: {'username': me.did}));
  }
}
