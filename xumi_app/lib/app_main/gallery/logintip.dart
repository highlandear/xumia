import 'package:flutter/material.dart';
import '../../data/global.dart';
import '../../login/sign.dart';
import 'main.dart';
class LoginTipPage extends StatefulWidget {
  const LoginTipPage({Key? key}) : super(key: key);

  @override
  _LoginTipPageState createState() => _LoginTipPageState();
}

class _LoginTipPageState extends State<LoginTipPage> {

  _getMe(){
    setState(() {
    });
  }

  _login()  {
    Navigator.of(context)
        .push(
      MaterialPageRoute(builder: (_) => const SignPage()),
    )
        .then((val) => val != null ? _getMe() : null);
  }

  @override
  Widget build(BuildContext context) {
    if(! Global.user.info.online()) {
      return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _login, child: const Text('我的画廊')),
              ],
            ),
          ));
      }
    return const Gallery();
  }
}