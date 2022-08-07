import 'package:flutter/material.dart';

import '../../utils/richqbar.dart';

class ArtifactView extends StatelessWidget {
  const ArtifactView({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;

  String _getHash() {
    String ret = imageURL.replaceFirst('https://www.cognitivelab.net/ipfs/', '');
    return 'HASH: $ret';
  }

  String _getInfo() {
    return 'test';
  }

  _buildMe() {
    return ListView(
      children: [
        Text(_getHash(), style: const TextStyle(fontSize: 14)),


        const Divider(),
        Image.network(imageURL, fit: BoxFit.fitWidth),
        // Container(
        //   child: Image.network(imageURL, fit: BoxFit.fitWidth),
        //   decoration: BoxDecoration(
        //       border: Border.all(color: Colors.grey, width: 2),
        //   //    borderRadius: BorderRadius.circular(2)
        //   ),
        // ),
        RichQBarView(data: _getInfo(), size:100),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("画作"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: _buildMe(),
      ),
    );
  }
}
