import 'package:flutter/material.dart';

class FullScreenImagePage extends StatefulWidget {
  final String  imageurl;
  const FullScreenImagePage(this.imageurl);

  @override
  _FullScreenImagePageState createState() {
    return _FullScreenImagePageState();
  }
}
class _FullScreenImagePageState extends State<FullScreenImagePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片详情页面"),
        centerTitle: true,
      ),
      body:Container(
        margin: EdgeInsets.all(20.0),
        child: Image.network(widget.imageurl, fit: BoxFit.fitWidth,),
      ),
    );
  }
}
