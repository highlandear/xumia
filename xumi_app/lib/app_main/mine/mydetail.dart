import 'package:flutter/material.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../mode/clickitem.dart';
import '../mode/clickitemlist.dart';

class DetailInfoView extends StatelessWidget {
  DetailInfoView({Key? key}) : super(key: key);

  final _models = [
    ClickEntryItem(cap : '扫码', img: 'assets/images/mine/mine_collection.png'),
    ClickEntryItem(cap : '扫码', img: 'assets/images/mine/mine_collection.png'),
    ClickEntryItem(),
    ClickEntryItem(),
    ClickEntryItem(),

    ClickEntryItem(cap : '扫码'),

  ];

  _onTap(String cap){
      XToast.success(cap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('详细信息'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      body: ClickItemListView( clist: _models, tap: _onTap),
    );
  }
}