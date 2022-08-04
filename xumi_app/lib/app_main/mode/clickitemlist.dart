import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/mode/clickitem.dart';

import '../../data/colors.dart';

class ClickItemListView extends StatelessWidget {
  const ClickItemListView({Key? key, required this.clist, required this.tap})
      : super(key: key);

  final List clist;

  final Function tap;

  _buildIcon(ClickEntryItem item) {
    return item.img.isNotEmpty
        ? SizedBox(
            width: 30,
            height: 30,
            child: Image(image: AssetImage(item.img)),
          )
        : const Padding(padding: EdgeInsets.all(0));
  }

  _buildText(String text) {
    if (text.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 10),
      );
    }
    return Text(text, style: const TextStyle(fontSize: 20));
  }

  Widget _buidItem(ClickEntryItem item) {
    return InkWell(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(8)),
              _buildIcon(item),
              const Padding(padding: EdgeInsets.all(8)),
              Text(item.cap, style: const TextStyle(fontSize: 20)),
            ],
          ),
          const Divider(height: 20),
        ],
      ),
      onTap: () {
        tap(item.cap);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> wlist = [];
    wlist.add(const SizedBox(height: 10));
    for (var element in clist) {
      wlist.add(_buidItem(element));
    }
    return ListView(
      children: wlist,
    );
  }
}
