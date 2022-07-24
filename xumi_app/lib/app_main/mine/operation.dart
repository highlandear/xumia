import 'package:flutter/material.dart';
import '../../bean/userinfo.dart';
import '../mine/ticketcart.dart';
import '../../bean/gnftdata.dart';
import '../../data/global.dart';
import '../../utils/browser.dart';
import '../../utils/xqrscan.dart';
import '../../utils/xtoast.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';
import 'settings.dart';
import 'head.dart';

class MineContent extends StatefulWidget {
  const MineContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineContentState();
}

class _MineContentState extends State<MineContent> {
  final _models = [
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/find/find_scan.png', '扫码', 'scan', false),
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_collection.png', '门票', '3', true),
    ClickItem('assets/images/mine/mine_wallet.png', '会员', '2', true),
    ClickItem('assets/images/mine/mine_collection.png', '家园', '4', true),
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_setting.png', '设置', 'setting', false),
    ClickItem('assets/images/mine/mine_setting.png', '测试写入', 'save', false),
    ClickItem('assets/images/mine/mine_setting.png', '测试读取', 'load', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: _buildItems(context, _tap),
      ),
    );
  }

  _tap(BuildContext context, String type) {
    if (!Global.user.online()) {
      XToast.error('请点击头像登录');

      //TODO
     // return;
    }

    switch (type) {
      case 'setting':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (SettingsPage());
        }));
        break;
      case 'scan':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (const BarcodeScanPage());
        }));
        break;
      case 'cards':
        XToast.toast('我的卡包功能');
        break;
      case '4':
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const Browser(
           // url: 'http://cognitivelab.net/me.html',
             url:'https://www.wenjuan.com/lib_detail_full/57d8fbd8a320fc086b497ff2',
            title: "Flutter 中文社区",
          );
        }));
        break;
      case '2':
        XToast.toast('我的卡包功能');

        break;
      case 'save':
        Global.user.localSave(UserInfo(phoneID: '123456', token: 'abcdefg'));
        XToast.toast(type);
        break;
      case 'load':
        Global.user.loadLocalUserInfo();
        XToast.toast(type);
        break;

      default:
        Global.user.reqMyData(int.parse(type), success: (data) {
          _onData(context, type, data);
        }, fail: (error) {

        });
        break;
    }
  }

  _onData(context, type, data) {
    switch (type) {
      case '3':
        var list = GNFTData.listfromJson(data);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TicketListView(data: list);
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
