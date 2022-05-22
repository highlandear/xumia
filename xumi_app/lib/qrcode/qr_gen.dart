import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

/**
 * 首页
 */
class QRHomePage extends StatefulWidget {
  @override
  _QRHomePageState createState() => _QRHomePageState();
}

class _QRHomePageState extends State<QRHomePage>
    with AutomaticKeepAliveClientMixin { // 切换界面保持，不被重置

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("我的二维码"),
      ),
      body: new Center(
        child: new QrImage(
          data: "黄小笛的测试数据https://www.cat.log.net",
          size: 200.0,
        ),
      ),
    );
  }
}