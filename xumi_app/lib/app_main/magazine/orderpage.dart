import 'package:flutter/material.dart';
import 'package:xumi_app/bean/certipass.dart';

import '../../bean/useraddr.dart';

class OrderInfoPage extends StatelessWidget {
  OrderInfoPage({Key? key, required this.product, this.address}) : super(key: key);

  var address;

  final CertiPass product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("订单信息"),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                const SizedBox(height: 20),
                if(address != null) _buildAddressItem(address),
                _buildProductInfo(context),
                _buildButton(context),
              ],
            ),
          ],
        ));
  }

  Widget _buildAddressItem(AddressInfo address) {
    return ListTile(
      leading: const Icon(Icons.house_outlined, color: Colors.red,),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${address.name}(${address.phone})'),
            const SizedBox(height: 10),
            Text(
                '${address.prov}/${address.city}/${address.dist}/${address.detail}'),
            const Divider(height: 20),
          ]),
    );
  }
  Widget _buildProductInfo(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_bag),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(product.desc),
            const Divider(height: 20),
          ]),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(15.0)),
      child: const Text('确认购买', style: TextStyle(color: Colors.white)),
      onPressed: () {},
    );
  }
}
