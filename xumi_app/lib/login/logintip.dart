import 'package:flutter/material.dart';
import '../data/global.dart';
import '../app_main/gallery/main.dart';
import 'smslogin.dart';

class LoginTipPage extends StatefulWidget {
  const LoginTipPage({Key? key, required this.tip}) : super(key: key);
  final String tip;

  @override
  _LoginTipPageState createState() => _LoginTipPageState();
}

class _LoginTipPageState extends State<LoginTipPage> {
  _getMe() {
    setState(() {});
  }

  _login() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (_) => const SmsLogin()),
        )
        .then((val) => val != null ? _getMe() : null);
  }

  @override
  Widget build(BuildContext context) {
    if (!Global.user.info.online()) {
      return Scaffold(
          body: Center(
        child: _buildButton(context),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(onPressed: _login, child: const Text('进入我的画廊'), style: ,),
        //   ],
        // ),
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
          //_onBuyItem(context);
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
