import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'card.dart';
import 'full.dart';

class StaggerView extends StatelessWidget {
  const StaggerView({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: 4,
            crossAxisSpacing: 6,
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Material(
                elevation: 8.0,
                // borderRadius: const BorderRadius.all(
                //   Radius.circular(8.0),
                // ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FullScreenImagePage(
                            imageURL: data[i].data,
                          );
                        },
                      ),
                    );
                  },
                  child: CardView(
                    nft: data[i],
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2)));
  }
}
