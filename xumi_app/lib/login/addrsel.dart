import 'package:flutter/material.dart';
import '../bean/useraddr.dart';
import '../data/global.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {

  Widget _buildDefaultView(UserAddress d) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           // Text('${d.name}(${d.tel})'),
            const SizedBox(height: 10),
           // Text(d.address),
            Text(d.detail),
            const Divider(height: 20),

          ]),
      trailing: const Icon(Icons.edit, color: Colors.blue),

      onTap: () {

      },
    );
  }

  Widget _buildOtherAddrView(UserAddress d) {
    return ListTile(
     // leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
         //   Text('${d.name}(${d.tel})'),
            const SizedBox(height: 10),
         //   Text(d.address),
          ]),
      trailing: const Icon(Icons.edit, color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("收货地址列表"),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                const SizedBox(height: 20),
               // _buildDefaultView(Global.user.myaddres),
                const Divider(height: 20),
               // _buildOtherAddrView(Global.user.myaddres),
              ],
            ),
          ],
        ));
  }
}