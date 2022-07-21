import 'package:flutter/material.dart';
import '../bean/useraddr.dart';
import '../data/global.dart';

class MyAddressListPage extends StatefulWidget {
  const MyAddressListPage({Key? key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressListPage> {

  Widget _buildDefaultView(UserAddress addr) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${addr.name}(${addr.phone})'),
            const SizedBox(height: 10),
            Text(addr.detail),

          ]),
      trailing: const Icon(Icons.edit, color: Colors.blue),

      onTap: () {
      },
    );
  }

  Widget _buildOtherAddrView(UserAddress addr) {
    return ListTile(
     // leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Divider(height: 20),
            Text('${addr.name}(${addr.phone})'),
            const SizedBox(height: 10),
            Text(addr.detail),
          ]),
      trailing: const Icon(Icons.edit, color: Colors.blue),
    );
  }

  List<Widget> _buildx(List<UserAddress> all){
    List<Widget> list = [];
    all.forEach((element) { 
      if(! element.isDefault) {
        list.add(_buildOtherAddrView(element));
      }
    });
    
    return list;
  }
  Widget _buildAllAddresswithoutDefault(List<UserAddress> all){
    return  Column(
        children: _buildx(all)
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
                _buildDefaultView(Global.user.getDefaultAddress()),
                const Divider(height: 20),
                _buildAllAddresswithoutDefault(Global.user.getAddressList()),
              ],
            ),
          ],
        ));
  }
}