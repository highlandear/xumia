import 'package:flutter/material.dart';
import '../../../../bean/user_info.dart';
import '../../../../data/global.dart';
import '../login/login.dart';
import 'detail.dart';
import 'colors.dart';

class MyInfoHead extends StatefulWidget {
  @override
  _MyInfoHeadState createState() => _MyInfoHeadState();
}

class _MyInfoHeadState extends State<MyInfoHead> {
  late UserInfo me;

  @override
  void initState() {
    super.initState();
    _getMe();
  }

  _getMe() {
    setState(() {
      me = Global.mydata.me;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!me.online())
          Navigator.of(context)
              .push(
                new MaterialPageRoute(builder: (_) => LoginPage()),
              )
              .then((val) => val != null ? _getMe() : null);
        else {
          Navigator.of(context)
              .push(
            new MaterialPageRoute(builder: (_) => MydetailView()),
          )
              .then((val) => val != null ? _getMe() : null);
        }
      },
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            left: 20,
            top: 100,
            child: _buildMyInfo(),
          ),
          Positioned(
            right: 15,
            top: 148,
            child: _buildArrow(),
          ),
        ],
      ),
    );
  }

  Row _buildMyInfo() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          //child: Image.network(me.image),
          child: Image(
            image: AssetImage('assets/images/mine/head.jpg'),
          ),
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
                me.online() ? me.username : '点击登录',
                style: TextStyle(
                  color: MineColors.xumi_black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                me.online() ? me.did : '点击登录',
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

  Row _buildArrow() {
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
