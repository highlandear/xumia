import 'dart:convert';
import 'package:flutter/material.dart';

import '../data/nftdata.dart';
import 'NFTView.dart';

class MagzinePage extends StatefulWidget {
  @override
  _MagPageState createState() => _MagPageState();
}

class _MagPageState extends State<MagzinePage> {
  PageController pageController = new PageController(keepPage: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        //body: this.getMain(),
        body: Stack(
          children: <Widget>[
            Container(
              child: PageView.builder(
                controller: pageController,
                itemCount: NFTData.nlist.length,
                // reverse: false,
                physics: PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return NFTView(index: index);
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
