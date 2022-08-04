import 'package:flutter/material.dart';
import 'package:xumi_app/data/global.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../bean/question.dart';
import '../../utils/loading.dart';
import 'questionview.dart';

/// 整个问卷（包含多个问题）
class QuestionListView extends StatelessWidget {
  const QuestionListView({Key? key, required this.data, required this.certiID})
      : super(key: key);
  final List<Question> data;
  final int certiID;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];
    cards.add(
      const SizedBox(height: 60),
    );
    for (var element in data) {
      cards.add(QuestionView(
        question: element,
      ));
    }
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
    for (var element in data) {
      print(element.answer.isEmpty);
      if (element.answer.isEmpty) {
        ok = false;
      }
    }
    if (!ok) {
      XToast.error('没有作答');
      return;
    }

    print(Question.toAnswerListJson(certiID, data));

    LoadingDialog.showLoading(context);
    Global.user.postMyQuestionAnswer(Question.toAnswerListJson(certiID, data),
        success: () {
      Navigator.pop(context);
      Navigator.pop(context, true);
      XToast.success('返回成功');
    }, fail: () {
      Navigator.pop(context);
      XToast.success('返回失败');
    });
  }
}
