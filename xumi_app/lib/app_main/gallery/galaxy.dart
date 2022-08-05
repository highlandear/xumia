import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  @override
  _CategorypageState createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TabBar(
                    indicatorColor: Colors.red,
                    isScrollable: true, //多个按钮可以滑动
                    tabs: <Widget>[
                      Tab(text: "画作"),
                      Tab(text: "门票"),
                      Tab(text: "会员卡"),
                      Tab(text: "游戏道具"),
                      Tab(text: "热门5"),
                 //     Tab(text: "推荐6"),
                //      Tab(text: "热门7"),
                //      Tab(text: "推荐8"),
                    ]),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          //   foregroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: <Widget>[
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
            // ListView(
            //   children: [
            //     ListTile(
            //       title: Text("第6个tab"),
            //     ),
            //     ListTile(
            //       title: Text("第二个tab"),
            //     ),
            //   ],
            // ),
            // ListView(
            //   children: [
            //     ListTile(
            //       title: Text("第7个tab"),
            //     ),
            //     ListTile(
            //       title: Text("第二个tab"),
            //     ),
            //   ],
            // ),
            // ListView(
            //   children: [
            //     ListTile(
            //       title: Text("第8个tab"),
            //     ),
            //     ListTile(
            //       title: Text("第二个tab"),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
