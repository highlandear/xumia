import 'package:best_flutter_ui_templates/mag/NFTView.dart';
import 'package:flutter/material.dart';

class MagHomeScreen extends StatefulWidget {
  const MagHomeScreen({Key? key}) : super(key: key);

  @override
  _MagHomeScreenState createState() =>
      _MagHomeScreenState();
}

class _MagHomeScreenState
    extends State<MagHomeScreen> with TickerProviderStateMixin {
  //AnimationController? _animationController;

  @override
  void initState() {
   // _animationController =
   //     AnimationController(vsync: this, duration: Duration(seconds: 8));
   // _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
   // _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 //   print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            //getAppBarUI(),
          //  NFTView(
   //           animationController: _animationController!,
          //  ),

          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
  //  _animationController?.animateTo(0.8,
  //      duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    /*
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }

     */
  }

  void _onNextClick() {
    /*
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }

     */
  }


  void _signUpClick() {
    Navigator.pop(context);
  }
}
