import 'dart:async';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app_main/mine/mine_main.dart';

class MinePage extends StatefulWidget {
  @override
  MinePageState createState()=> MinePageState();
}

class MinePageState extends State <MinePage> with SingleTickerProviderStateMixin {

  final StreamController<double> _streamController = StreamController();

  double _topY = 0;
  bool _hideTop = true;

  final double _contentHeight = window.physicalSize.height / 2.0 - 64;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        PanGestureRecognizer : GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
              ()=>PanGestureRecognizer(),
              (PanGestureRecognizer instace){
            instace
              ..onStart = (details) {

              }
              ..onUpdate = (details) {
                print('update');
                _streamController.sink.add(
                    _topY += details.delta.dy * (_hideTop ? 0.5 : 0.2 )
                );
              }
              ..onEnd = (details) {
                print('end');
                _didHideTopWhenEndPanning();
              }
              ..onCancel = (){
                print('cancel');
              }
              ..onDown = (details){
                print('down');
              };
          },
        ),
      },
      child: StreamBuilder<double>(
        stream: _streamController.stream,
        initialData: _topY,
        builder: (context, snapShot){
          // print('topY $_topY');
          // return MineBody(_topY);
          return MineMainPage();
        },
      ),
    );
  }

  // 滑动结束
  void _didHideTopWhenEndPanning(){
    if (!_hideTop) {
      if (_topY < _contentHeight - 100) {
        _hideTopWhenEndPaning();
      } else {
        _showTopWhenEndPanning();
      }
    } else {
      if (_topY > 200) {
        _showTopWhenEndPanning();
      } else {
        _hideTopWhenEndPaning();
      }
    }
  }

  // 隐藏 Header 动画
  void _hideTopWhenEndPaning(){
    _initAnimation(true);
    _startAnimation();
  }

  // 展示 Header 动画
  void _showTopWhenEndPanning(){
    _initAnimation(false);
    _startAnimation();
  }

  late Animation <double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void  dispose(){
    _controller.dispose();
    super.dispose();
  }

  // 初始化动画
  void _initAnimation(isHide){
    _animation = Tween<double>(
      begin: _topY,
      end: isHide ? 0 : _contentHeight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
      _streamController.sink.add(
          _topY = _animation.value
      );
    })..addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _streamController.sink.add(
            _topY = isHide ? 0 : _contentHeight
        );
        _hideTop = isHide;
      }
    });
  }

  // 执行动画
  Future _startAnimation() async {
    try {
      await _controller.forward(from: 0).orCancel;
    } on TickerCanceled {

    }
  }
}


