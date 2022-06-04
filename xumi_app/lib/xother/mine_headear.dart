import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xumi_app/bean/user_info.dart';
import 'package:xumi_app/data/global.dart';
import '../utils/qr_gen.dart';
import '../app_main/mine/mine_color.dart';

class MineHeader extends StatefulWidget{
  @override
  _MineHeaderState createState() => _MineHeaderState();
}
class _MineHeaderState extends State<MineHeader>  {
  UserInfo me = Global.mydata.me ;
  @override
  void initState() {
    super.initState();
    Global.mydata.loadMe();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('XXXXXXXXXXXXXXXXXX ');
        //Navigator.push(context, MaterialPageRoute(builder: (context) {
      //    return QRHomePage();
       // }));
      },
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            left: 20,
            top: 100,
            child: _infoRow(),
          ),
          Positioned(
            right: 15,
            top: 148,
            child: _scanRow(),
          ),
        ],
      ),
    );
  }

  Row _infoRow() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          //child: Image.network(me.image),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15),
        ),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                me.tel == '' ? '点击登录' : me.tel,
                style: TextStyle(
                  color: MineColors.xumi_black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // '微信号: Maojunhao',
                me.did,
                style: TextStyle(
                  color: MineColors.xumi_black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _scanRow() {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Image(
            image: AssetImage('assets/images/mine/mine_scan.png'),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        SizedBox(
          width: 10,
          height: 20,
          child: Image(
              image: AssetImage('assets/images/find/find_arrow_right.png')),
        ),
      ],
    );
  }
}
