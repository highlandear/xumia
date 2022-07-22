import 'package:flutter/material.dart';
import '../bean/useraddr.dart';
import '../data/global.dart';
import '../utils/xtoast.dart';
import 'addressedit.dart';

/// 显示地址列表信息
/// 优先显示 ** 默认地址
/// 其他地址中，不再显示默认地址
/// sel：true，选择后返回，false，只查看
class MyAddressListPage extends StatefulWidget {
   const MyAddressListPage({Key? key, this.sel=false}) : super(key: key);
   final bool sel;

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressListPage> {
  // 单一地址信息
  Widget _buildAddressItem(AddressInfo address) {

    return ListTile(
      leading:
          address.isDefault ? const Icon(Icons.check, color: Colors.red) : null,
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${address.name}(${address.phone})'),
            const SizedBox(height: 10),
            Text(
                '${address.prov}/${address.city}/${address.dist}/${address.detail}'),
            const Divider(height: 20),
          ]),
      trailing: GestureDetector(
        onTap: () {
          _onEditAddress(address);
        },
        child: const Icon(Icons.edit, color: Colors.blue),
      ),
      selected: address.isDefault ? true : false,
      onTap: () {
        _onSelectAddress(address);
      },
    );
  }

  _onEditAddress(AddressInfo address) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return (AddressEditPage(id: address.id));
    }));
  }

  _onSelectAddress(AddressInfo address) {
    if(widget.sel){
      Navigator.pop(context, address.id);
    }
    XToast.toast('select ${address.id.toString()}');
  }

  Widget _buildDefaultAddress() {
    return _buildAddressItem(Global.user.getDefaultAddress());
  }

  Widget _buildAllAddressWithoutDefault() {

    List<Widget> list = [];
    Global.user.getAddressList().forEach((element) {
      if (!element.isDefault) {
        list.add(_buildAddressItem(element));
      }
    });
    return Column(children: list);
  }

  Widget _buildButton() {
    return ElevatedButton(
      style: TextButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(15.0)),
      child: const Text('添加新地址', style: TextStyle(color: Colors.white)),
      onPressed: () {
        XToast.toast('添加新地址');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (AddressEditPage());
        }));
      },
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
                _buildDefaultAddress(),
                _buildAllAddressWithoutDefault(),
                _buildButton(),
              ],
            ),
          ],
        ));
  }
}
