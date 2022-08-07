import 'package:flutter/material.dart';
import 'package:xumi_app/bean/gnftdata.dart';
import '../gallery/ticketshow.dart';

/// 门票列表
class TicketListView extends StatelessWidget {
  const TicketListView({Key? key, required this.data, required this.title})
      : super(key: key);
  final List data;
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];

    for (var element in data) {
      cards.add(_buildCard(context, element));
    }
    if (cards.isEmpty) {
      cards.add(_buildEmptyCard(context));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('title'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView(
          children: cards,
        ));
  }

  Widget _buildEmptyCard(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 50.0,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              child: const Text('目前没有门票/会员卡',
                  style: TextStyle(fontSize: 20)),
              margin: const EdgeInsets.all(10),
            ),
            const ListTile(
              title: Text("你可以到杂志页选购相应的产品"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, GNFTData item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TicketShowPageX(
                ticket: item,
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 50.0,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                item.nftpath,
                fit: BoxFit.cover,
              ),
              margin: const EdgeInsets.all(10),
            ),
            ListTile(
              leading: const CircleAvatar(),
              title: Text(item.desc),
              subtitle: Text(
                item.extra,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
