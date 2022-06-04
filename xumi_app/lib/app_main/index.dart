import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/home/home_page.dart';
import '../bean/user_info.dart';
import '../data/global.dart';
import '../utils/local_util.dart';
import 'bag.dart';
import '../xother/mag_page.dart';
import 'mine/mine_main.dart';

class Indexpage extends StatefulWidget {
  @override
  _IndexpageState createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  final List<BottomNavigationBarItem> bottomtabs=[
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "会员中心"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),label: "杂志"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag),label: "收藏"),
  ];

  final List taBodies=[MineMainPage(),HomePage(),BagPage()];
  //final List taBodies=[MineMainPage(),MagzinePage(),BagPage()];
  int currentIndex=1;
  var currentPage;

  @override
  void initState() {
    currentPage=taBodies[currentIndex];
    super.initState();

   // Global.mydata.loadMe();
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
