import 'package:flutter/material.dart';

class TipView extends StatelessWidget {
  const TipView({Key? key, required this.msg, required this.ontap})
      : super(key: key);
  final String msg;
  final Function ontap;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _buildButton(context),
    ));
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 60,
      width: 200,
      child: GestureDetector(
        onTap: () => ontap(),
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
              child: Text(
            msg,
            style: const TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
