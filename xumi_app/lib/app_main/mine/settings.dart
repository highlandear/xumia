import 'package:flutter/material.dart';
import '../../utils/xtoast.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final _models = [
    ClickItem('', '', 'divid', false),
    ClickItem('assets/images/mine/mine.png', '账号安全', 'acc', false),
    ClickItem('assets/images/find/find_scan.png', '地址管理', 'addr', false),
    ClickItem('', '', 'divid', false),
    ClickItem(
        'assets/images/mine/mine_collection.png', '其他设置', 'settings', true)
  ];

  _tap(BuildContext context, String type) {
    switch (type) {
      case 'acc':
        XToast.toast('账号安全');
        break;
      case 'addr':
        XToast.toast('地址管理');
        break;
      case 'settings':
        XToast.toast('其他设置');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ItemModelView(_models, _tap),
    );
  }
}