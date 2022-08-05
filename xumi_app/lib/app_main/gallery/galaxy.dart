import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  @override
  _CategorypageState createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  final _tabs = [
    const Tab(text: "画作"),
    const Tab(text: "门票"),
    const Tab(text: "会员卡"),
    const Tab(text: "游戏道具"),
    const Tab(text: "热门5"),
  ];

  final _views = [
      ListView(
        children: [
          ListTile(
            title: Text("第一个tab"),
          ),
          ListTile(
            title: Text("第一个tab"),
          ),
        ],
      ),
      ListView(
        children: [
          ListTile(
            title: Text("第二个tab"),
          ),
          ListTile(
            title: Text("第二个tab"),
          ),
        ],
      ),
      ListView(
        children: [
          ListTile(
            title: Text("第三个tab"),
          ),
          ListTile(
            title: Text("第二个tab"),
          ),
        ],
      ),
      ListView(
        children: [
          ListTile(
            title: Text("第四个tab"),
          ),
          ListTile(
            title: Text("第二个tab"),
          ),
        ],
      ),
      ListView(
        children: [
          ListTile(
            title: Text("第五个tab"),
          ),
          ListTile(
            title: Text("第二个tab"),
          ),
        ],
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TabBar(
                    indicatorColor: Colors.red,
                    isScrollable: true, //多个按钮可以滑动
                    tabs: _tabs),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          //   foregroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: _views,
        ),
      ),
    );
  }
}
