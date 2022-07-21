import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/gallery/stagger.dart';
import '../../bean/gnftdata.dart';
import 'full.dart';

class GalleryCardsView extends StatelessWidget {
  const GalleryCardsView({Key? key, required this.data}) : super(key: key);
  final List<GNFTData> data;

  @override
  Widget build(BuildContext context) {
    if(data.length > 2){
      return StaggerView(data: data);
    }

    List<Widget> cards = [];

    for (var element in data) {
      cards.add(_buildCard(context, element));
    }
    if (cards.isEmpty) {
      cards.add(_buildEmptyCard(context));
    }
    return ListView(
      children: cards,
    );
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
              child: const Text('目前没有通证'),
              margin: const EdgeInsets.all(10),
            ),
            const ListTile(
              title: Text("你可以到杂志页选购相应产品，获取通证"),
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
              return FullScreenImagePage(
                imageURL: item.nftpath,
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
              leading: const CircleAvatar(
                  //  backgroundImage: NetworkImage(
                  //     item.desc),
                  ),
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
