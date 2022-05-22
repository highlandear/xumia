import 'dart:async';

import 'package:flutter/material.dart';

import '../demo/nftdata.dart';

class NFTView extends StatefulWidget {

  NFTView({Key? key, required this.index})  : super(key: key);
  int index;
  @override
  State<StatefulWidget> createState() {
    return NFTViewState();
  }
}

class NFTViewState extends State<NFTView> {
  ScrollController scroController = new ScrollController();
  late Timer timer;
  void startTimer() {
    int time = 3000;
    timer = Timer.periodic(new Duration(milliseconds: time), (timer) {
      if (scroController.positions.isNotEmpty == false) {
        print('界面被销毁');
        return;
      }
      double maxScrollExtent = scroController.position.maxScrollExtent;
      if (maxScrollExtent > 0) {
        scroController.animateTo(maxScrollExtent,
            duration: new Duration(milliseconds: (time * 0.5).toInt()),
            curve: Curves.linear);
        Future.delayed(Duration(milliseconds: (time * 0.5).toInt()), () {
          if (scroController.positions.isNotEmpty == true) {
            scroController.animateTo(0,
                duration: new Duration(milliseconds: (time * 0.5).toInt()),
                curve: Curves.linear);
          }
        });
      } else {
     //   print('不需要移动');
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.startTimer();
  }

  @override
  void dispose() {
    this.scroController.dispose();
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this.showNFT(),
      //  this.getUserAndTitle()
      ],
    );
  }

  // 视频播放(假的不是重点)
  Widget showNFT() {
    return Container(
      color: Colors.white,
      child: Center(
        //child: Image.asset(widget.image),
       // child: Image.asset(NFTData.nlist[widget.index].path),
        child:Image.network(NFTData.nlist[widget.index].path),
      ),
    );
  }

  Widget getMusicTitle() {
    return Container(
      // color: Colors.red,
      // alignment: Alignment.centerLeft,
      child: Text(
        "三根皮带歌曲,哗啦啦啦啦啦啦啦啦啦啦啦",
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget getUserAndTitle() {
    return Positioned(
      bottom: 60,
      child: Padding(
        padding: EdgeInsets.only(left: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                '@' + NFTData.nlist[widget.index].owner,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              width: 250,
              child: Text(
                  NFTData.nlist[widget.index].desc,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            Container(
              // color: Colors.red,
              // alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 5),
              width: 200,
              height: 25,
              child: ListView(
                // reverse: true,
                controller: scroController,
                physics: new NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
              //  children: <Widget>[this.getMusicTitle()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
