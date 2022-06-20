import 'package:flutter/material.dart';

class FullScreenImagePage extends StatefulWidget {

  const FullScreenImagePage({Key? key, required this.imageURL}) : super(key: key);
  final String  imageURL;

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
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
        title: const Text("图片详情页面"),
        centerTitle: true,
      ),
      body:Container(
        margin: const EdgeInsets.all(20.0),
        child: Image.network(widget.imageURL, fit: BoxFit.fitWidth,),
      ),
    );
  }
}
