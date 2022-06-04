import 'package:flutter/material.dart';
import 'package:xumi_app/data/global.dart';
import 'package:xumi_app/utils/qr_scan.dart';
import '../../bean/user_info.dart';

class MemberPage extends StatelessWidget {
  UserInfo me = Global.mydata.me;
  @override
  Widget buildc(BuildContext context) {
    return Scaffold(
      body: Center(
          //child: Text("我的信息"),
          child: Row(
        children: <Widget>[
          TextButton(
            child: const Text("我的二维码"),
            onPressed: () {

            },
          ),
          TextButton(
            child: const Text("扫码"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BarcodeScanPage();
              }));
            },
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 4),
                    child: Text(
                      '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(60.0)),
                    //  child: Image.asset(me.image),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  '我的二维码',
                  style: TextStyle(
                    //   fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                onTap: () {

                },
              ),
              ListTile(
                title: Text(
                  '扫码',
                  style: TextStyle(
                    //   fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BarcodeScanPage();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  '退出登录',
                  style: TextStyle(
                    //   fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
