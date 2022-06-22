import 'package:flutter/material.dart';
import '../../data/global.dart';
import '../../utils/xqrscan.dart';
import '../../utils/xtoast.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';
import 'settings.dart';
import 'head.dart';

class MineContent extends StatelessWidget {
   MineContent({Key? key}) : super(key: key);

   final _models = [
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/find/find_scan.png', '扫码', 'scan', false),
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_collection.png', '门票', 'ticket', true),
    ClickItem('assets/images/mine/mine_wallet.png', '卡包', 'cards', true),
    ClickItem('assets/images/mine/mine_collection.png', '家园', 'home', true),
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_setting.png', '设置', 'setting', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItems(context, _tap),
    );
  }

_tap(BuildContext context, String type){
  if (! Global.user.info.online()) {
    XToast.error('请点击登录');
    return;
  }
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
            return (const BarcodeScanPage());
          }));
      break;
    case 'ticket':
      XToast.toast('门票功能');
      break;
    case 'cards':
      XToast.toast('我的卡包功能');
      break;
    default:
      break;
  }
}

_buildItems(BuildContext context, Function tap) {

   List<Widget> _items = [];
    _items.add(
      const SizedBox(
        height: 200,
        child: MyInfoHead(),
      ),
    );
    _items.add(ItemModelView(_models, _tap));

    return _items;
  }
}
