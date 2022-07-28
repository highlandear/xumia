import 'package:flutter/material.dart';
import 'package:xumi_app/bean/gnftdata.dart';

import '../../utils/richqbar.dart';

/// 门票详细
class TicketShowPage extends StatelessWidget {
  const TicketShowPage({Key? key, required this.ticket}) : super(key: key);

  final GNFTData ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("门票信息"),
        centerTitle: true,
      ),
      body:Stack(
        children: [
              Image.network(
                ticket.nftpath,),
          Center(child: RichQBarView(ticket.extra),),

        ],

      )
      // body: ListView(
      //   children: [
      //     Column(
      //       children: [
      //         RichQBarView(ticket.extra),
      //       ],
      //     ),
      //
      //     Image.network(
      //       ticket.nftpath,),
      //
      //   ],
      // ),
    );
  }
}
