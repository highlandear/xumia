import 'package:flutter/material.dart';

import '../../bean/certipass.dart';

class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({Key? key, required this.item}) : super(key: key);
  final CertiPass item;

  @override
  Widget build(BuildContext context) {
    return buildListView(context);
  }

  Widget buildListView(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                ///banner广告图
                child: Column(
                  children: <Widget>[
                    Image.network(
                      item.cover,
                     // fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100,
                  height: 100,
                  padding:
                      const EdgeInsets.only(left: 12, right: 48, top: 40, bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: const Icon(Icons.keyboard_arrow_left),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        //  buildBodyView(context),
          _buildDescCard(context),
        ],
      ),
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
            Text("item.owner"),
            ListTile(
              title: Text(item.desc),
            )
          ],
        ),
      ),
    );
  }
}