import 'package:flutter/material.dart';
import 'package:xumi_app/data/global.dart';
import '../../utils/qr_scan.dart';
import 'mine_settings.dart';
import 'mine_head.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';

class MineContent extends StatelessWidget {
  final _models = [
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/find/find_scan.png', '扫码', 'scan', false),
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine_collection.png', '收藏', '', true),
    ClickItem('assets/images/mine/mine_wallet.png', '卡包', '', true),
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine_setting.png', '设置', 'setting', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItems(context, _tap),
    );
  }
_tap(BuildContext context, String type){
  switch (type) {
    case 'setting':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return (SettingsPage());
          }));
      break;
    case 'scan':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return (BarcodeScanPage());
          }));
      break;
    default:
      break;
  }
}

_buildItems(BuildContext context, Function tap) {

   List<Widget> _items = [];
    _items.add(
      Container(
        height: 200,
        child: MyInfoHead(),
      ),
    );
    _items.add(ItemModelView(_models, _tap));

    return _items;
  }
}
