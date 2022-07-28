import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/mode/clickitem.dart';

class ClickItemListView extends StatelessWidget {
  const ClickItemListView({Key? key, required this.clist, required this.tap})
      : super(key: key);

  final List<ClickEntryItem> clist;

  final Function tap;

  Widget _buidItem(ClickEntryItem item) {
    return InkWell(
      child:  Column(
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(18)),
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
