import 'package:flutter/material.dart';
import '../../../data/global.dart';
import '../../login/newaddress.dart';
import '../../login/addrsel.dart';
import '../../utils/xqrgen.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';

class MyDetailView extends StatelessWidget {
  final _models = [
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_scan.png', '我的二维码', 'myqr', false),
    ClickItem('assets/images/find/find_scan.png', '地址管理', 'addr', false),
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_collection.png', '退出登录', 'exit', true)
  ];

  MyDetailView({Key? key}) : super(key: key);

  _tap(BuildContext context, String type) {
    switch (type) {
      case 'myqr':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          //return (QRPage('二维码信息', Global.mydata.me.did));
          return (QRPage('二维码信息', 'http://cognitivelab.net/app-release.apk'));
        }));
        break;
      case 'addr':
         _showAddressInfo(context);
        break;
      case 'exit':
        Global.user.logout();
        Navigator.pop(context, true);
        break;
      default:
        break;
    }
  }

  _showAddressInfo(BuildContext context) {
    if (Global.user.house.hasAddress()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const MyAddressPage());
      }));
      return;
    }

    Global.user.reqMyAddress(success:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const MyAddressPage());
      }));
    }, fail: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const AddAddressPage(title: '填写收件人信息'));
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