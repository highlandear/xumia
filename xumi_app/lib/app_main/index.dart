import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/magazine/maglist.dart';
import 'gallery/galleryview.dart';
import '../xref/mainx.dart';
import 'mine/main.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs=[
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "我的"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "杂志"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag),label: "画廊"),
  ];

 // final List taBodies=[const MineMainPage(),const HomePage(),const Gallery()];
  final List taBodies=[const MineMainPage(),const MagLisView(),const Gallery()];
  int currentIndex=1;
  var currentPage;

  @override
  void initState() {
    currentPage=taBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(147, 24, 24, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage=taBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
