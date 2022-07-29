import 'package:flutter/material.dart';

class CardModelView extends StatelessWidget {
  const CardModelView(
      {Key? key,
      required this.img,
      required this.desc,
      this.owner = '',
      this.detail = ''})
      : super(key: key);
  final String desc;
  final String img;
  final String owner;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            //    borderRadius: BorderRadius.circular(2)
          ),
          child: Image.network(img, fit: BoxFit.cover),
          margin: const EdgeInsets.all(0),
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 10,
            ),

            Text(desc),
            // Text(nft.extra),
          ],
        ),
        // Text(nft.desc),
        Text(detail),
      ],
    );
  }
}
