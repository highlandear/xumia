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
    cards.add(
      const SizedBox(height: 60),
    );
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
        child: const Text('提交', style: TextStyle(color: Colors.white)),
        onPressed: () {
          _onCollected(context);
        });
  }

  _onCollected(BuildContext context) {
    bool ok = true;
    data.forEach((element) {
      print(element.answer.isEmpty);
      if (element.answer.isEmpty) {
        ok = false;
      }
    });

    if (ok) Navigator.pop(context, true);
  }
}
