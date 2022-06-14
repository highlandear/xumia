import 'package:flutter/material.dart';
import 'full.dart';

class CardsView extends StatelessWidget {
  CardsView({Key? key, required this.data}) : super(key: key);
  var data;

  @override
  Widget build(BuildContext context) {
    List<Widget> det = [];
    data.forEach((element) {
      det.add(_buildCard(context, element));
    });
    return ListView(
      children: det,
    );
  }

  Widget _buildCard(BuildContext context, item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FullScreenImagePage(item.path);
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
                item.path,
                fit: BoxFit.cover,
              ),
              margin: const EdgeInsets.all(10),
            ),
            const ListTile(
              leading: CircleAvatar(
                  //  backgroundImage: NetworkImage(
                  //     item.desc),
                  ),
              title: Text("Candy Shop"),
              subtitle: Text(
                "Flutter is Goole's moblie UI framework for crafting higt ",
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
