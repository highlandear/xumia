import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xumi_app/utils/request_data.dart';
import '../data/nftdata.dart';
import 'bag.dart';
import 'mag_page.dart';
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
  final List taBodies=[MemberPage(),MagzinePage(),BagPage()];

  int currentIndex=1;
  var currentPage;

  @override
  void initState() {
    currentPage=taBodies[currentIndex];
    super.initState();
    loadMainPage();
  }

  void loadMainPage() {
    RequestData('http://10.0.0.6:8080/logon.do').request().then((value) => {
      print(value),
      NFTData.nlist = (jsonDecode(value) as List<dynamic>)
          .map((e) => NFTData.fromJson((e as Map<String, dynamic>)))
          .toList()
    });
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
