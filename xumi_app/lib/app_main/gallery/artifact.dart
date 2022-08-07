import 'package:flutter/material.dart';

import '../../utils/richqbar.dart';

class ArtifactView extends StatelessWidget {
  const ArtifactView({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;

  String _getHash() {
    String ret =
        imageURL.replaceFirst('https://www.cognitivelab.net/ipfs/', '');
  //  return 'HASH: $ret';
    return '$ret';
  }

  String _getInfo() {
    return 'test';
  }

  _buildMe() {
    return ListView(
      children: [
        const Divider(thickness: 2),
        Text(_getHash(), style: const TextStyle(fontSize: 14)),
        const Divider(thickness: 2),
        RichQBarView(data: _getInfo(), size: 100),
        const Divider(thickness: 2),
        Image.network(imageURL, fit: BoxFit.fill,),
        const Divider(thickness: 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详细"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:  _buildMe(),
    //  ),
    );
  }
}
