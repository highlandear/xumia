import 'package:flutter/material.dart';

class JdText extends StatelessWidget {
  final String text;
  final bool password;
  var onChanged;
  final int maxLines;
  final double height;
  JdText(
      {Key? key,
      this.text = "输入内容",
      this.password = false,
      this.onChanged,
      this.maxLines = 1,
      this.height = 68})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        maxLines: maxLines,
        obscureText: password,
        decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        onChanged: onChanged,
      ),
      //height: ScreenAdapter.height(this.height),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    );
  }
}
