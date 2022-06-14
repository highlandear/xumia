import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'full.dart';

class StaggerView extends StatelessWidget {
  StaggerView({Key? key, required this.data}) : super(key: key);
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('widget.title'),
      // ),
      body: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: this.data.length,
        itemBuilder: (context, i) {
          return Material(
            elevation: 8.0,
            borderRadius: new BorderRadius.all(
              new Radius.circular(8.0),
            ),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) {
                      return FullScreenImagePage(data[i].path);
                    },
                  ),
                );
              },
              child: new Hero(
                tag: data[i].path,
                //child: CachedNetworkImage(
                child: Image.network(data[i].path),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index == 0 ? 2.5 : 3), //
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
