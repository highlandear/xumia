import 'package:flutter/material.dart';
import '../bean/nftdata.dart';
import '../data/config.dart';
import '../data/global.dart';
import '../utils/http_util.dart';
import '../utils/httphelper.dart';
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
   // loadContent();
  }

  @override
  Widget build(BuildContext context) {
    print('+++++bul+++++\t');

    return WillPopScope(
      onWillPop: () {
        return new Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              child: PageView.builder(
                controller: pageController,
                itemCount: Global.mydata.nlist.length,
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
