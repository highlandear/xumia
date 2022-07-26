import 'package:flutter/material.dart';
import 'package:xumi_app/bean/gnftdata.dart';
import 'full.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key, required this.nft}) : super(key: key);
  final GNFTData nft;

  @override
  Widget build(BuildContext context) {
   return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FullScreenImagePage(
                imageURL: nft.nftpath,
              );
            },
          ),
        );
      },
      child:  Column(
          children: <Widget>[
            Container(
              child: Image.network(
                nft.nftpath,
                fit: BoxFit.cover,
              ),
              margin: const EdgeInsets.all(0),
            ),
          //  Text(nft.caption),

            Text(nft.desc),
            // const CircleAvatar(
            //   radius: 10,
            //   //  backgroundImage: NetworkImage(
            //   //     item.desc),
            // ),

          ],
        ),
    );
  }
}
