import 'package:flutter/material.dart';
import 'package:xumi_app/data/global.dart';
import 'splash.dart';
import 'utils/xtoast.dart';

void main() {
 runApp(XToast.wrap(const MyApp()));
//   runApp(const MyApp());

  Global.user.autoLogin();
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
           primarySwatch: Colors.blueGrey,
          primaryColor: Colors.white
      ),
     home:  const SplashPage(),
      //  home : const HomePage(),
    );
  }
}
