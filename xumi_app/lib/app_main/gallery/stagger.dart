import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xumi_app/bean/gnftdata.dart';
import '../mode/cardmodel.dart';
import 'artifact.dart';

class StaggerView extends StatelessWidget {
  const StaggerView({Key? key, required this.data}) : super(key: key);
  final List data;

  Widget _buildCardModeView(GNFTData nft) {
    return CardModelView(
      desc: nft.desc,
      img: nft.nftpath,
      detail: nft.extra,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Material(
                elevation: 8.0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ArtifactView(
                            imageURL: data[i].nftpath,
                          );
                        },
                      ),
                    );
                  },
                  child: _buildCardModeView(data[i]),
                ),
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2)));
  }
}
