import 'package:flutter/material.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../bean/question.dart';

class QuestionOptionView extends StatefulWidget {
  const QuestionOptionView({Key? key, required this.cap}) : super(key: key);
  final String cap;

  @override
  createState() => _QuestionOptionViewState();
}

class _QuestionOptionViewState extends State<QuestionOptionView> {

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,     // 当前值
      onChanged: (which) {
        setState(() {
          checked = !checked;
          XToast.toast('选择了：$checked');
        });
      },
      title: Text(widget.cap),
      selected: checked ,
    );
  }

}
