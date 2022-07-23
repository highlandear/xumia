import 'package:flutter/material.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../../data/global.dart';
import '../../login/addressedit.dart';
import '../../login/addresslist.dart';
import '../../utils/xqrgen.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';

class MyDetailView extends StatelessWidget {
  MyDetailView({Key? key}) : super(key: key);

  final _models = [
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_scan.png', '我的二维码', 'barcode', false),
    ClickItem('assets/images/find/find_scan.png', '地址管理', 'address', false),
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_collection.png', '退出登录', 'exit', true)
  ];

  _tap(BuildContext context, String type) {
    switch (type) {
      case 'barcode':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          //return (QRPage('二维码信息', Global.mydata.me.did));
          return (const QRPage('二维码信息', 'http://cognitivelab.net/app-release.apk'));
        }));
        break;
      case 'address':
        _showMyAddressList(context);
        break;
      case 'exit':
        Global.user.logout();
        Navigator.pop(context, true);
        break;
      default:
        break;
    }
  }

  _showMyAddressList(BuildContext context) {
    // 本地已经存储了邮寄地址
    if (Global.user.hasAddress()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const MyAddressListPage());
      }));
      return;
    }

    // 本地没有地址信息，向服务器请求数据
    Global.user.reqMyAddress(success:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (const MyAddressListPage());
        }));
      // if(Global.user.hasAddress()) { // 如果请求到地址列表
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return (const MyAddressListPage());
      //   }));
      // }
      // else{   // 请求到的列表为空
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return (AddressEditPage());
      //   }));
      // }
    }, fail: () {
      XToast.toast('cannot get address list');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const MyAddressListPage());
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('详细信息')),
      body: ItemModelView(_models, _tap),
    );
  }
}