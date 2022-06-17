import 'package:flutter/material.dart';
import 'package:xumi_app/bean/deliverdata.dart';
import 'package:xumi_app/data/global.dart';

class AddressListPage extends StatefulWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  var addlist = [];

  Widget _buildPreaddrView(DeliverData d) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${d.name}(${d.tel})'),
            SizedBox(height: 10),
            Text("北京市海淀区西二旗"),
          ]),
      trailing: Icon(Icons.edit, color: Colors.blue),
    );
  }

  Widget _buildOtherView(DeliverData d) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${d.name}(${d.tel})'),
            SizedBox(height: 10),
            Text("北京市海淀区西二旗"),
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
                  _buildPreaddrView(Global.mydata.house),
                  Divider(height: 20),
                  _buildOtherView(Global.mydata.house),
                ],
              ),
            ],
          ),
        ));
  }
}
