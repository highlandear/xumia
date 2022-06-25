import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/gallery/card.dart';
import '../../bean/gnftcard.dart';
import '../../bean/gnftdata.dart';
import '../../data/global.dart';
import '../../utils/browser.dart';
import '../../utils/xqrgen.dart';
import '../../utils/xqrscan.dart';
import '../../utils/xtoast.dart';
import '../gallery/main.dart';
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
  /*
    case 'ticket':
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        //return (QRPage('二维码信息', Global.mydata.me.did));
        return (const Gallery());
      }));
      break;
   */
    case 'cards':
      XToast.toast('我的卡包功能');
      break;

     case 'home':
        Navigator.of(context)
            .push( MaterialPageRoute(builder: (_) {
          return const Browser(
            url:'https://www.sohu.com/a/377307706_293887',
            // url:'https://www.wenjuan.com/lib_detail_full/57d8fbd8a320fc086b497ff2',
            title: "Flutter 中文社区",
          );
        }));

      break;

    default:
      Global.user.reqMyData(type, success: (data){
        _onData(context, type, data);
      }, fail: (){

      });
      break;
  }
}

_onData(context, type, data){
    switch(type){
      case 'ticket':
        var list = GNFTCard.listfromJson(data);
        Navigator.of(context)
            .push( MaterialPageRoute(builder: (_) {
          return CardsView(data: list);
        }));
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
