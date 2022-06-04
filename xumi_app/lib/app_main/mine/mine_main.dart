import 'package:flutter/material.dart';
import 'mine_color.dart';
import 'mine_content.dart';
class MineMainPage extends StatefulWidget{
  @override
  _MineMainPageState createState() => _MineMainPageState();

}
class _MineMainPageState extends State<MineMainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: MineColors.xumi_gray,),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: MineContent(),
          // child: MineView(),
        ),
      ],
    );
  }
}