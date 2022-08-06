import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RichQBarView extends StatefulWidget {
  const RichQBarView({Key? key, required this.data, required this.size}) : super(key: key);

  final String data;
  final double size;

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
      backgroundColor: Colors.white,
          data: widget.data,
          size: widget.size,
    );
  }
}