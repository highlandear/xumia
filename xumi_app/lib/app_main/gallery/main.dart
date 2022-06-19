import 'package:flutter/material.dart';
import 'package:xumi_app/login/sign.dart';
import '../../data/global.dart';
import 'card.dart';
import 'logintip.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  final Future _future = Global.user.loadGalleryData();

  @override
  Widget build(BuildContext context) {
    if(Global.user.info.online()) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _futureBuilder(),
      );
    }
    return const LoginTipPage();
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
                return CardsView(data: async.data);
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
