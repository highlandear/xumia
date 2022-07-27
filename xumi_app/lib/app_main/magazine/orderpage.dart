import 'package:flutter/material.dart';
import '../../bean/certipass.dart';
import '../../bean/useraddr.dart';
import '../../data/global.dart';

class OrderInfoPage extends StatelessWidget {
  OrderInfoPage({Key? key, required this.product, this.address})
      : super(key: key);

  final CertiPass product;

  var address;

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
                if (address != null) _buildAddressItem(address),
                _buildProductInfo(context),
                _buildButton(context),
              ],
            ),
          ],
        ));
  }

  Widget _buildAddressItem(AddressInfo address) {
    return ListTile(
      leading: const Icon(
        Icons.house_outlined,
        color: Colors.red,
      ),
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
      child: const Text('确认收藏', style: TextStyle(color: Colors.white)),
      onPressed: () {
        _buyThisItem(context);
      },
    );
  }

  _buyThisItem(BuildContext context) {
    Global.user.reqBuyItem(product.id, address == null ? 0 : address.id,
        success: () {
      _buyTips(context);
    }, fail: () {});
  }

  _buyTips(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //设置为false，点击空白处弹窗不关闭
      builder: (context) {
        return AlertDialog(
          content: const Text('已经成功购入'),
          actions: <Widget>[
            TextButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
