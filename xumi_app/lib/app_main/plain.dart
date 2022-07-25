import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/magazine/maglist.dart';
import 'gallery/galleryview.dart';
import '../xref/mainx.dart';
import 'mine/main.dart';

class PlainPage extends StatelessWidget {
  PlainPage({Key? key}) : super(key: key);

  final List taBodies=[const MineMainPage(),const MagLisView(),const Gallery()];
  int currentIndex=1;
  var currentPage;
  final PageController _pageController = PageController(initialPage: 1, keepPage: false);

  @override
  Widget build(BuildContext context) {
      return PageView.builder(
      controller: _pageController,
      itemCount: taBodies.length,
      physics: const PageScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return taBodies[index];
      },
     // scrollDirection: Axis.vertical,
    );
  }
}
