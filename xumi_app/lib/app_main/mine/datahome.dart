import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/magazine/questionair.dart';
import 'package:xumi_app/bean/question.dart';
import '../magazine/questionview.dart';
import '../mine/ticketcart.dart';
import '../../bean/gnftdata.dart';
import '../../data/global.dart';
import '../../utils/browser.dart';
import '../../utils/xtoast.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';
import 'head.dart';
import 'mydetail.dart';

class MineContent extends StatefulWidget {
  const MineContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineContentState();
}

class _MineContentState extends State<MineContent> {
  final _models = [
    ClickItem('', '', 'divide', false),
    ClickItem('assets/images/mine/mine_collection.png', '门票', '3', true),
    ClickItem('assets/images/mine/mine_wallet.png', '会员', '2', true),
    ClickItem('assets/images/mine/mine_collection.png', '家园', '4', true),
    ClickItem('assets/images/mine/mine_collection.png', '测试', '0', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
     color: Colors.blueGrey,
      child: Column(
        children: _buildItems(context, _tap),
      ),
    );
  }

  _tap(BuildContext context, String type) {
    if (!Global.user.online()) {
      XToast.error('请点击头像登录');
      return;
    }

    switch (type) {
      case '0':
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return DetailInfoView();
        }));
        break;
      case '4':
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const Browser(
            url: 'https://www.html5tricks.com/demo/html5-3d-cube/index.html',
            title: '我的家园',
          );
        }));
        break;

      // case '2':
      //   XToast.toast('我的卡包功能');
      //
      //   break;

      default:
        Global.user.reqMyData(int.parse(type), success: (data) {
          _onData(context, type, data);
        }, fail: (error) {});
        break;
    }
  }

  _onData(context, type, data) {
    switch (type) {
      case '3':
        var list = GNFTData.listfromJson(data);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TicketListView(data: list, title: '我的门票',);
        }));
        break;

      case '2':
        var list = GNFTData.listfromJson(data);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TicketListView(data: list, title: '我的会员卡',);
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
