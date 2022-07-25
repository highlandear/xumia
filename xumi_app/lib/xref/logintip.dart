import 'package:flutter/material.dart';
import '../data/global.dart';
import '../app_main/gallery/galleryview.dart';
import '../login/smslogin.dart';

/// 提示用户进行登录的页面
class LoginTipPageX extends StatefulWidget {
  const LoginTipPageX({Key? key, required this.tip}) : super(key: key);
  final String tip;

  @override
  _LoginTipPageState createState() => _LoginTipPageState();
}

class _LoginTipPageState extends State<LoginTipPageX> {
  _getMe() {
    setState(() {});
  }

  _login() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (_) => const SmsLoginPage()),
        )
        .then((val) => val != null ? _getMe() : null);
    //Login.login(context);
  }

  @override
  Widget build(BuildContext context) {
    if (!Global.user.online()) {
      return Scaffold(
          body: Center(
        child: _buildButton(context),
      ));
    }
    return const Gallery();
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 60,
      width: 200,
      child: GestureDetector(
        onTap: () {
          _login();
        },
        child: Container(
          //  margin: const EdgeInsets.all(100),
          decoration: const ShapeDecoration(
            gradient: LinearGradient(colors: [
              Colors.amber,
              Colors.amber,
            ]),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          child: Center(
              child: Text(widget.tip,
            style: const TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
