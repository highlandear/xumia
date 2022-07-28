import 'package:flutter/material.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../mode/clickitem.dart';
import '../mode/clickitemlist.dart';

class DetailInfoView extends StatelessWidget {
  DetailInfoView({Key? key}) : super(key: key);

  final _models = [
    ClickEntryItem('扫码'),
    ClickEntryItem(''),
    ClickEntryItem(''),
    ClickEntryItem(''),
    ClickEntryItem('设置aa'),
  ];

  _onTap(String cap){
      XToast.success(cap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('详细信息')),
      body: ClickItemListView( clist: _models, tap: _onTap),
    );
  }
}