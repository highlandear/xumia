import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xumi_app/bean/deliverdata.dart';
import 'package:xumi_app/login/addrsel.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../bean/nftdata.dart';
import '../../data/config.dart';
import '../../data/global.dart';
import '../../login/address.dart';
import '../../login/sign.dart';
import '../../utils/xhttp.dart';

class MagLeafView extends StatelessWidget {
  const MagLeafView({Key? key, required this.item}) : super(key: key);
  final NFTData item;

  _buyItem(BuildContext context) {
    if (!Global.mydata.me.online()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const SignPage());
      }));
      return;
    }

    XToast.toast('已经登录');
    // 本地有地址
    if (Global.mydata.house.hasAddress()) {
      XToast.toast('已有地址');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const MyAddressPage()));
      return;
    }

    XHttp.instance.get(Config.reqAddr, params: {
      'username': Global.mydata.me.tel,
    }).then((val) {
      print(val);
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        Global.mydata.house = DeliverData.fromJson(jsonDecode(val)['data']);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const MyAddressPage()));
        return;
      }
      if (erode == '1') {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (_) => AddAddressPage(
                      title: '收件人信息',
                      itemid: item.id,
                    )))
            .then((value) {
          XToast.toast('ok');
        });
      }
    });
  }
  //  print('${Global.mydata.me.tel} buy this one, ${item.path}');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _showMagItem(),
        _showBuyButton(context),
      ],
    );
  }

  Widget _showMagItem() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.network(item.path),
      ),
    );
  }

  Widget _showBuyButton(BuildContext context) {
    return Positioned(
      bottom: 5.0,
      right: 165,
      child: InkWell(
        onTap: () {
          _buyItem(context);
        },
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 2,
            bottom: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            border: Border.all(color: Colors.blue),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.blue,
            size: 28,
          ),
        ),
      ),
    );
  }
}
