import 'package:flutter/material.dart';

import '../../utils/richqbar.dart';

class TicketShowPage extends StatelessWidget {
  const TicketShowPage({Key? key, required this.info}) : super(key: key);

  final String info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("门票信息"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const RichQBarView('test'),
          Image.network(
            info,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
