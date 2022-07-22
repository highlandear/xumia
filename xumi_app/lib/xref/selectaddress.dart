import 'package:flutter/material.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../bean/useraddr.dart';
import '../data/global.dart';
import '../login/loading.dart';

class AddressSelectionPage extends StatefulWidget {
  AddressSelectionPage({Key? key, required this.data}) : super(key: key);

  int data;

  @override
  _AddressSelectionPageState createState() => _AddressSelectionPageState();
}

class _AddressSelectionPageState extends State<AddressSelectionPage> {
  Widget _buildDefaultView(AddressInfo d) {
    return ListTile(
      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(d.detail),
            const Divider(height: 20),
          ]),
      onTap: () {},
    );
  }

  Widget _buildOtherView(AddressInfo d) {
    return ListTile(
      // leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //   Text('${d.name}(${d.tel})'),
            const SizedBox(height: 10),
            // Text(d.address),
          ]),
      //  trailing: Icon(Icons.edit, color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("请选择收货地址"),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                const SizedBox(height: 20),
                //  _buildDefaultView(Global.user.house),

                ElevatedButton(
                    onPressed: () {
                      _buyThisItem(context);
                    },
                    child: const Text('确认')),
              ],
            ),
          ],
        ));
  }

  _buyThisItem(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: CircularProgressIndicator(),
          );
        });
    Global.user.reqBuyItem(widget.data, success: () {
      XToast.success('请等待收货');
      Navigator.pop(context);
      Navigator.pop(context);
    }, fail: () {});
  }
}
