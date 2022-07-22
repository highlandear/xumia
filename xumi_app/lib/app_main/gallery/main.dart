import 'package:flutter/material.dart';
import '../../data/global.dart';
import 'gcard.dart';
import '../../login/logintip.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  late Future _future;// = Global.user.loadGalleryData();

  @override
  Widget build(BuildContext context) {

    if(Global.user.online()) {
      _future = Global.user.loadGalleryData();
      return Scaffold(
        backgroundColor: Colors.white,
        body: _futureBuilder(),
      );
    }
    else {
      return const LoginTipPage(tip: '登录进入我的画廊');
    }
  }

  _buildWaiting() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildError(String e) {
    return Center(
      child: Text(e),
    );
  }

  FutureBuilder _futureBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot async) {
        switch (async.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return _buildWaiting();
          case ConnectionState.done:
            {
              if (async.hasError) return _buildError('请检查网络');
              if (async.hasData) {

              return GalleryCardsView(data: async.data);
                //return StaggerView(data: async.data);
              }
              return _buildError('e2');
            }
          default:
            return _buildError('e3');
        }
      },
      future: _future,
    );
  }
}