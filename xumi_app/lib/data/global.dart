import 'dart:convert';
import '../bean/nftdata.dart';
import '../bean/user_info.dart';
import '../utils/http_util.dart';
import '../utils/local_util.dart';
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

  logout(){
    me = UserInfo();
  }

  Future loadData() async {
    //  return NFTData.listfromJson(await XHttp.instance.get(Config.FRESH));
    return NFTData.listfromJson(
        await XHttp.instance.get(Config.FRESH, params: {'username': me.did}));
  }
}
