import 'package:flutter/material.dart';
import '../../bean/question.dart';

/// 单个问题
///
class QuestionView extends StatefulWidget {
  QuestionView({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  late List<int> _chked;
  late Question _question;

  Widget _buildQuestionView() {
    _question = widget.question;
    _chked = _question.answer;

    int index = 0;
    List<Widget> wlist = <Widget>[];

    wlist.add(Text(_question.stem));
    wlist.add(const Divider(height: 20));

    for (var element in _question.options) {
      _question.radio
          ? wlist.add(_buildRadioItem(element, index++))
          : wlist.add(_buildCheckItem(element, index++));
    }

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: wlist);
  }

  Widget _buildCheckItem(String cap, int index) {
    return CheckboxListTile(
      value: _chked.contains(index),
      onChanged: (which) {
        setState(() {
          _chked.contains(index) ? _chked.remove(index) : _chked.add(index);
          // if (chked.contains(index)) {
          //   XToast.toast('选择了：$index');
          // } else {
          //   XToast.toast('取消了：$index');
          // }
        });
      },
      title: Text(cap),
      selected: _chked.contains(index),
    );
  }

  Widget _buildRadioItem(String cap, int index) {
    return RadioListTile(
      value: index, // 当前值
      onChanged: (which) {
        setState(() {
          _chked.clear();
          _chked.add(which as int);
          //   XToast.toast('${chked[0]} 选择了：$which');
          //    print()
        });
      },

      groupValue: _chked.isEmpty ? -1 : _chked[0],
      title: Text(cap),
      selected: _chked.isEmpty ? false : _chked[0] == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuestionView();
  }
}
