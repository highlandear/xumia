import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bean/question.dart';
import 'questionview.dart';

/// 整个问卷（包含多个问题）
class QuestionListView extends StatelessWidget {
  const QuestionListView({Key? key, required this.data}) : super(key: key);
  final List<Question> data;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];
    data.forEach((element) {
      cards.add(QuestionView(
        question: element,
      ));
    });
    cards.add(_buildButton(context));

    return Scaffold(
      appBar: AppBar(title: const Text("小任务")),
      body: ListView(
        children: cards,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(15.0)),
      child: const Text('确认购买', style: TextStyle(color: Colors.white)),
      onPressed: () {
        data.forEach((element) {
          print(element.answer.toString());
        });
      },
    );
  }
}
