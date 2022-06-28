import 'package:flutter/material.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../bean/certipass.dart';
import '../../data/global.dart';
import '../../login/newaddress.dart';
import '../../login/selectaddress.dart';
import '../../login/sign.dart';
import '../../utils/browser.dart';
import 'buypage.dart';
import 'itemdetail.dart';

class MagLeafView extends StatelessWidget {
  const MagLeafView({Key? key, required this.item}) : super(key: key);
  final CertiPass item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _showMagItem(context),
        _showDescx(),
        _showBuyButton(context),
      ],
    );
  }

  Widget _showMagItem(BuildContext context) {
    // print(item.condition);
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width, // 屏幕宽度
      height: MediaQuery.of(context).size.height, // 屏幕高度

      // child: Center(
      child: Image.network(item.cover, fit: BoxFit.cover),

      //),
    );
  }

  Widget _showDescx() {
    return Positioned(
      left: 10,
      right: 0,
      bottom: 80,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: Colors.blue.withOpacity(0.6),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.yellow,
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
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(item.desc,
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showBuyButton(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 120,
      child: InkWell(
        onTap: () {
          _watchDetail(context);
          //  _buyItem(context);
        },
        child: Container(
            height: 48,
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 2,
              bottom: 0,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(color: Colors.blue),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              child: const Center(
                  child: Text(
                "点击查看详情",
                style: TextStyle(color: Colors.white),
              )),
            )),
      ),
    );
  }

  _watchDetail(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      // return (PassDetailPage(item: this.item));
      return (ShopDetailPage(item : item));
    }));
  }

  _buyItem(BuildContext context) {
    // 没有登录，先登录
    if (!Global.user.info.online()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return (const SignPage());
      }));
      return;
    }

    if (item.condition == 'ad') {
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
    } else if (item.condition.isEmpty) {
      Global.user.reqBuyItem(item.id, success: () {
        XToast.success('已经直接购入，请查看');
      }, fail: () {});
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Browser(
          url: item.condition,
          title: "请完成小任务",
        );
      }));

      /* Global.user.reqBuyItem(item.id, success: (){
        XToast.success('已经直接购入，请查看');

      }, fail:(){});*/
    }
  }
}
