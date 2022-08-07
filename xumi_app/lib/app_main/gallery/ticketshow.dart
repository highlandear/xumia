import 'package:flutter/material.dart';

import '../../bean/gnftdata.dart';
import '../../utils/richqbar.dart';

/// 门票详细
class TicketShowPageX extends StatelessWidget {
  const TicketShowPageX({Key? key, required this.ticket}) : super(key: key);

  final GNFTData ticket;

  _getMyInfo(){
    return 'test';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("门票信息"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Image.network(
              ticket.nftpath,
            ),
            Center(
              child: RichQBarView(data: _getMyInfo(), size:100),
            ),
          ],
        ));
  }
}
