import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  QRPage(this.title,this.data);

  String title;
  String data;
  @override
  _QRHomePageState createState() => _QRHomePageState();
}

class _QRHomePageState extends State<QRPage>
    with AutomaticKeepAliveClientMixin { // 切换界面保持，不被重置

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new QrImage(
          data: widget.data,
          size: 200.0,
        ),
      ),
    );
  }
}