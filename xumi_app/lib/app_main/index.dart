import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/home_page.dart';
import '../bean/nftdata.dart';
import '../data/config.dart';
import '../data/global.dart';
import '../utils/httphelper.dart';
import '../utils/request_data.dart';
import 'bag.dart';
import 'mag_page.dart';
import 'member_page.dart';

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
  //final List taBodies=[MemberPage(),MagzinePage(),BagPage()];
  final List taBodies=[MemberPage(),HomePage(),BagPage()];

  int currentIndex=1;
  var currentPage;

  @override
  void initState() {
    currentPage=taBodies[currentIndex];
    super.initState();
  }

  void loadContent() {
     Http.http.get(Config.LOGIN, onSuccess: (value) {
      Global.mydata.nlist = NFTData.listfromJson(value);
      print('###################');
    }, onError: (String error) {
      print('XXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    });
  }

  void loadMag()  {
    RequestData('http://10.0.0.6:8080/signin.do').request().then((value) => {
      print(value),
      Global.mydata.nlist = (jsonDecode(value) as List<dynamic>)
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
