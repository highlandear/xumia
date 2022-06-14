import 'package:flutter/material.dart';
import '../../../data/global.dart';
import '../../utils/xqrgen.dart';
import '../../utils/xqrscan.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';

class MydetailView extends StatelessWidget {
  final _models = [
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine_scan.png', '我的二维码', 'myqr', false),
   // ClickItem('assets/images/find/find_scan.png', '地址管理', 'addr', false),
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine_collection.png', '退出登录', 'exit', true)
  ];

  _tap(BuildContext context, String type) {
    switch (type) {
      case 'myqr':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (QRPage('二维码信息', Global.mydata.me.did));
        }));
        break;
      case 'addr':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (BarcodeScanPage());
        }));
        break;
      case 'exit':
        Global.mydata.logout();
        Navigator.pop(context, true);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详细信息')),
      body: ItemModelView(_models, _tap),
    );
  }
}
