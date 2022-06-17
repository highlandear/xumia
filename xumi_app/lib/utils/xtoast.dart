import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class XToast{

  static const _defaultToastDuration = Duration(seconds: 2);
  static const _defaultToastColor = Color(0xFF424242);

  static wrap(Widget child) {
    return OKToast(
      ///字体大小
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      backgroundColor: _defaultToastColor,
      radius: 10,
      dismissOtherOnShow: true,
      textPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: child,
      duration: _defaultToastDuration,
    );
  }

  static void toast(String msg,
      {Duration duration = _defaultToastDuration,
        Color color = _defaultToastColor}) {
    showToast(msg, duration: duration, backgroundColor: color);
  }

  static void waring(String msg, {Duration duration = _defaultToastDuration}) {
    showToast(msg, duration: duration, backgroundColor: Colors.yellow);
  }

  static void error(String msg, {Duration duration = _defaultToastDuration}) {
    showToast(msg, duration: duration, backgroundColor: Colors.red);
  }

  static void success(String msg,
      {Duration duration = _defaultToastDuration}) {
    showToast(msg, duration: duration, backgroundColor: Colors.lightGreen);
  }
}