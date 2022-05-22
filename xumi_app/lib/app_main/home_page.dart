
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../demo/nftdata.dart';
import 'NFTView.dart';

class HomePage extends StatelessWidget {

 // StreamController<int> stream = new StreamController.broadcast();
  PageController pageController = new PageController(keepPage: false);
  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      body: Center(
        child: Text("杂志"),
      ),
    );*/
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        //body: this.getMain(),
        body:Stack(
          children: <Widget>[
            this.getScrollView(),
          ],
        ),
      ),
    );
  }
  Widget getScrollView() {
    return Container(
      child: PageView.builder(
        controller: pageController,
        itemCount: NFTData.nlist.length,
       // reverse: false,
        // physics: PageScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          print('##################');
          print(index);
          return NFTView(index: index);
        },
        // scrollDirection: Axis.horizontal,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

