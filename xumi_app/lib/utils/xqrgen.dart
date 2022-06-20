import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  const QRPage(this.title,this.data, {Key? key}) : super(key: key);

  final String title;
  final String data;

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: QrImage(
          data: widget.data,
          size: 200.0,
        ),
      ),
    );
  }
}