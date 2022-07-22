import 'package:flutter/material.dart';
import '../../bean/certipass.dart';

class PassDetailPage extends StatelessWidget {
  const PassDetailPage({Key? key, required this.item}) : super(key: key);
  final CertiPass item;

  @override
  Widget build(BuildContext context) {
   return ListView(
      children:  <Widget>[
        _buildPassCard(context, item),
        _buildDescCard(context),
      ]
    );
  }

  Widget _buildDescCard(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 50.0,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const Text("item.owner"),
             ListTile(
              title: Text(item.desc),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPassCard(BuildContext context, item) {
    return GestureDetector(
        child: Card(
        elevation: 50.0,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                item.cover,
                fit: BoxFit.cover,
              ),
              margin: const EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}