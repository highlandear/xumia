import 'package:flutter/material.dart';
import '../../bean/nftdata.dart';
import '../../data/global.dart';
import '../../login/newaddress.dart';
import '../../login/selectaddress.dart';
import '../../login/sign.dart';

class MagLeafView extends StatelessWidget {
  const MagLeafView({Key? key, required this.item}) : super(key: key);
  final NFTData item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _showMagItem(),
        _showDescx(),
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

   Widget _showDescx() {
    return Positioned(
      left: 20,
      bottom: 60,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.6),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.blue,
                Colors.blue,
              ]),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                '@' + item.owner,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(item.desc,
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ),
          ],
        ),
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

  _buyItem(BuildContext context) {
    // 没有登录，先登录
    if (!Global.user.info.online()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const SignPage());
      }));
      return;
    }

    // 本地有地址
    if (Global.user.house.hasAddress()) {
      // XToast.toast('已有地址');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (AddressSelectionPage(data: item.id));
      }));
      return;
    }

    // 本地无地址，向服务器请求
    Global.user.reqMyAddress(success: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (AddressSelectionPage(data: item.id));
      }));
    }, fail: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (AddAddressPage(title: '收件人信息', data: item.id));
      }));
    });
  }
}
