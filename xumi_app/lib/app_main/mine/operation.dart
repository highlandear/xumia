import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xumi_app/bean/question.dart';
import '../magazine/questionnaire.dart';
import '../mine/ticketcart.dart';
import '../../bean/gnftdata.dart';
import '../../data/global.dart';
import '../../utils/browser.dart';
import '../../utils/xtoast.dart';
import '../mode/item.dart';
import '../mode/list_view.dart';
import 'head.dart';

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
    //  XToast.error('请点击头像登录');

      //TODO
     // return;
    }

    switch (type) {


      case '4':
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const Browser(
           url: 'https://www.html5tricks.com/demo/html5-3d-cube/index.html',
           //  url:'https://www.wenjuan.com/lib_detail_full/57d8fbd8a320fc086b497ff2',
          );
        }));
        break;
      case '2':
        XToast.toast('我的卡包功能');
        // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        //   return const PDFScreen (url: 'http://africau.edu/images/default/sample.pdf',);
        //
        // }));s

        var q = Question(id: 10, stem: '你喜欢什么？', radio: true, options: ['fish', 'bear']);
        String json = jsonEncode(q.toJson());
        print(json);

        var wq = Question.fromJson(jsonDecode(json));
        print(wq.options[0]);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return  QuestionView( question: wq,);
        }));



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
