import 'dart:async';

import 'package:best_flutter_ui_templates/mag/screen_service.dart';
import 'package:best_flutter_ui_templates/mag/videocontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

import 'NFTView.dart';


class MagHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MagHomeState();
  }
}

class MagHomeState extends State<MagHome>
    with TickerProviderStateMixin {
  // ScrollController scroController = new ScrollController();
  // Timer timer;
  List images = ["assets/images/a.png",
    "assets/images/b.png",
    "assets/images/g1.gif"
  ];
  StreamController<int> stream = new StreamController.broadcast();
  PageController pageController = new PageController(keepPage: false);
  double flage = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      // print(pageController.page);
      if (pageController.page == 1) {
        this.stream.sink.add(1);
      } else if (pageController.page == 0) {
        this.stream.sink.add(0);
      }
    });
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
        body:Stack(
          children: <Widget>[
            this.getScrollView(),
            this.getTitleSwitch(),
            this.getBottom(),
          ],
        ),
      ),
    );
  }

    // 滑动
  Widget getScrollView() {
    return Container(
      child: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        reverse: true,
        // physics: PageScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
           return NFTView(index: index);
        },
       // scrollDirection: Axis.horizontal,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  /**
   * 推荐和关注栏
   */
  Widget getTitleSwitch() {
    return Positioned(
      top: 50,
      width: ScreenService.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  this.stream.sink.add(1);
                  pageController.jumpToPage(1);
                },
                child: StreamBuilder<int>(
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      "关注",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: snapshot.data == 1
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    );
                  },
                  stream: this.stream.stream,
                ),
              ),
              Container(
                width: 30,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  this.stream.sink.add(0);
                  pageController.jumpToPage(0);
                },
                child: StreamBuilder<int>(
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      "推荐",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: snapshot.data == 0
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    );
                  },
                  stream: this.stream.stream,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }



  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<StreamController<int>>('stream', stream));
  }

  /**
   * 我的，杂志，画廊
   */
  Widget getBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        height: 60,
        width: ScreenService.width,
        child: Row(
      children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        width: AppBar().preferredSize.height + 40,
        height: AppBar().preferredSize.height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(32.0),
            ),
            onTap: () {
              //  Navigator.pop(context);
              print('+++++++++++++++++');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
             // child: Icon(Icons.arrow_back),
              child: Icon(Icons.person),
            ),
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Text(
            '杂志',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
      ),
      Container(
        width: AppBar().preferredSize.height + 40,
        height: AppBar().preferredSize.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {print('================================');},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //  child: Icon(Icons.favorite_border),
                 // child: Icon(Icons.face),
                  child: Icon(Icons.toys),


                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //  child: Icon(FontAwesomeIcons.mapMarkerAlt),
                ),
              ),
            ),
          ],
        ),
      )
      ],
    ),
      ),
    );
  }

}
