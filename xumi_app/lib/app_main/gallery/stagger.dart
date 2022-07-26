import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'singlecard.dart';
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
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Material(
                elevation: 8.0,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
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
                  //child: Image.network(data[i].nftpath),
                  child: SinglecardView(nft: data[i],),
                ),
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2)));
  }
}
