import 'package:flutter/material.dart';
import 'package:xumi_app/xother/mag_item.dart';
import '../../data/global.dart';
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
   // Global.mydata.loadMyData();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              child: PageView.builder(
                controller: pageController,
             //   itemCount: Global.mydata.nlist.length,
                itemCount: 1,
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
      );
  }
}
