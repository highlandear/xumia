import 'package:flutter/material.dart';
import 'package:xumi_app/data/global.dart';
import '../../utils/qr_scan.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';

class SettingsPage extends StatelessWidget {
  final _models = [
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine.png', '账号安全', 'acc', false),
    ClickItem('assets/images/find/find_scan.png', '地址管理', 'addr', false),
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine_collection.png', '其他设置', 'exit', true)
  ];

  _tap(BuildContext context, String type) {
    switch (type) {
      case 'acc':
      case 'addr':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (BarcodeScanPage());
        }));
        break;
      case 'exit':
      //  Global.mydata.logout();
      //  Navigator.pop(context, true);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      body: ItemModelView(_models, _tap),
    );
  }
}
