import 'package:flutter/material.dart';

class ListTileItem {
  ListTileItem({required this.title, this.icon});
  var icon;
  String title;

  Widget toWidget(BuildContext context, ontap) {
    if (title.isEmpty) {
      return const Divider();
    }

    return ListTile(
      leading: Icon(icon),
      // CircleAvatar(child: Icon(icon),),
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {
        ontap(context, title);
      },
    );
  }

  static toWidgetList(
      {required BuildContext context, required List<ListTileItem> list, tap}) {
    List<Widget> wlist = [];
    for (var element in list) {
      wlist.add(element.toWidget(context, tap));
    }
    return wlist;
  }
}
