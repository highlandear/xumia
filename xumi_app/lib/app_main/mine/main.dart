import 'package:flutter/material.dart';
import '../../data/colors.dart';
import 'datahome.dart';

class MineMainPage extends StatefulWidget {
  const MineMainPage({Key? key}) : super(key: key);

  @override
  _MineMainPageState createState() => _MineMainPageState();
}

class _MineMainPageState extends State<MineMainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MineColors.xumi_gray,
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: MineContent(),
        ),
      ],
    );
  }
}
