import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'full.dart';

class StaggerView extends StatelessWidget {
  const StaggerView({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('widget.title'),
      // ),
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
                      return FullScreenImagePage(imageURL: data[i].path,);
                    },
                  ),
                );
              },
              child: Hero(
                tag: data[i].path,
                //child: CachedNetworkImage(
                child: Image.network(data[i].path),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index == 0 ? 2.5 : 3), //
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
