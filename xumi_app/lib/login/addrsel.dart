import 'package:flutter/material.dart';
import '../bean/deliverdata.dart';
import '../data/global.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {

  Widget _buildDefaultView(DeliverData d) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${d.name}(${d.tel})'),
            SizedBox(height: 10),
            Text(d.address),
            Text(d.detail),
            Divider(height: 20),

          ]),
      trailing: Icon(Icons.edit, color: Colors.blue),

      onTap: () {

      },
    );
  }

  Widget _buildOtherView(DeliverData d) {
    return ListTile(
     // leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${d.name}(${d.tel})'),
            SizedBox(height: 10),
            Text(d.address),
          ]),
      trailing: Icon(Icons.edit, color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("收货地址列表"),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  SizedBox(height: 20),
                  _buildDefaultView(Global.user.house),
                  Divider(height: 20),
                  _buildOtherView(Global.user.house),
                ],
              ),
            ],
          ),
        ));
  }
}