import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'member_page.dart';


class Indexpage extends StatefulWidget {
  @override
  _IndexpageState createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  final List<BottomNavigationBarItem> bottomtabs=[

  //  BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "分类"),

    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "会员中心"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "杂志"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag),label: "收藏"),
  ];
  final List taBodies=[MemberPage(),HomePage(),CatePage()];

  int currentIndex=1;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage=taBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(147, 24, 24, 1.0),
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
