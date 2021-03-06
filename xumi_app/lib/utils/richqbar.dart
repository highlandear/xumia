import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RichQBarView extends StatefulWidget {
  const RichQBarView(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  _QRichQBarViewState createState() => _QRichQBarViewState();

 }

class _QRichQBarViewState extends State<RichQBarView>
    with AutomaticKeepAliveClientMixin { // 切换界面保持，不被重置

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return QrImage(
          data: widget.data,
          size: 200.0,

    );
  }
}