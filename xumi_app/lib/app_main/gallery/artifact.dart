import 'package:flutter/material.dart';

class ArtifactView extends StatelessWidget {
  const ArtifactView({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;

  String _getHash() {
    String ret = imageURL.replaceFirst('https://www.cognitivelab.net/ipfs/', '');
    return 'HASH: $ret';
  }

  _buildMe() {
    return ListView(

      children: [
        Text(_getHash(), style: const TextStyle(fontSize: 14)),
        const Divider(),
        Container(
          child: Image.network(imageURL, fit: BoxFit.fitWidth),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
          //    borderRadius: BorderRadius.circular(2)
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("画作"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: _buildMe(),
      ),
    );
  }
}
