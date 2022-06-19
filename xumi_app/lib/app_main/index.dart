import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gallery/main.dart';
import 'magazine/main.dart';
import 'mine/main.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexpageState createState() => _IndexpageState();
}

class _IndexpageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomtabs=[
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "我的"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "杂志"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag),label: "画廊"),
  ];

  final List taBodies=[MineMainPage(),const HomePage(),const Gallery()];
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
        items: bottomtabs,
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
