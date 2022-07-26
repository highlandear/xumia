import 'package:flutter/material.dart';
import '../../bean/question.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({Key? key, required this.question}) : super(key: key);
  final Question question;

  Widget _buildAnswer() {
    List<Widget> _items = [];
    for (var element in question.options) {
      _items.add(Text(element));
      _items.add(Radio(
        value: element,
        onChanged: (value) {},
        groupValue: '',
      ));
    }
    return Column(
      children: _items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("收货地址列表"),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[const SizedBox(height: 20), buildx(context)],
            ),
          ],
        ));
  }

  Widget buildx(BuildContext context) {
    return ListTile(
      //      leading: const Icon(Icons.check, color: Colors.red),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(question.stem),
            const Divider(height: 20),
            _buildAnswer(),
            _buildButton(context),
            const Divider(height: 20),
          ]),

      selected: true,
      onTap: () {},
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
