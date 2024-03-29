import 'package:flutter/material.dart';
import '../../../../data/global.dart';
import '../../login/smslogin.dart';
import 'detail.dart';
import '../../data/colors.dart';

class MyInfoHead extends StatefulWidget {
  const MyInfoHead({Key? key}) : super(key: key);

  @override
  _MyInfoHeadState createState() => _MyInfoHeadState();
}

class _MyInfoHeadState extends State<MyInfoHead> {
  late String _title;

  @override
  void initState() {
    super.initState();
    _getMe();
  }

  _getMe() {
    setState(() {
      _title = Global.user.getPhone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (!Global.user.online()) {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(builder: (_) => const SmsLoginPage()),
                )
                .then((val) => val != null ? _getMe() : null);
          } else {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(builder: (_) => MyDetailView()),
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
      ),
    );
  }

  Row _buildMyInfo() {
    return Row(

      children: [
        const SizedBox(
          width: 80,
          height: 80,
          child: Image(
            image: AssetImage('assets/images/mine/mine.png'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
        ),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Global.user.online() ? '用户[${_title}]' : '点击登录',
                style: const TextStyle(
                  color: MineColors.xumi_black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Global.user.online() ? _title : '点击登录',
                style: const TextStyle(
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
      children: const [
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
