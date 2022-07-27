import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/magazine/qoption.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../bean/question.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {

  String radiosel = '';

  Widget _buildQuestionView(Question q) {
    var vlist = <Widget>[];
    vlist.add(Text(q.stem));

    int index;
    for (var element in q.options) {
      q.radio ?
      vlist.add(_buildRadioItem(element)): vlist.add(_buildCheckItem(element));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: vlist
    );
  }

  Widget _buildCheckItem(String cap) {
    return QuestionOptionView(cap:cap);
  }

  Widget _buildRadioItem(String cap) {
    return RadioListTile(
      value: cap,     // 当前值
      onChanged: (which) {
        setState(() {
          radiosel = which.toString();
          XToast.toast('选择了：$radiosel');
        });
      },
      groupValue: radiosel,
      title: Text(cap),
     // selected: sel == cap,
    );
  }

  @override
  Widget build(BuildContext context) {
  //  var q = Question(id: 10, stem: '你喜欢什么？', radio: true, options: ['fish', 'bear']);
    return Scaffold(
      appBar: AppBar(title: Text("RadioListTile")),
      body: _buildQuestionView(widget.question)
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(15.0)),
      child: const Text('确认购买', style: TextStyle(color: Colors.white)),
      onPressed: () {
        // _buyThisItem(context);
      },
    );
  }
}
