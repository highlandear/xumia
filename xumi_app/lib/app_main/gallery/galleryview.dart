import 'package:flutter/material.dart';
import 'stagger.dart';
import '../../data/global.dart';
import '../../login/smslogin.dart';
import '../../utils/tip.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Future _future = Global.user.loadGalleryData(); // = Global.user.loadGalleryData();

  _fresh() {
    setState(() {
      _future = Global.user.loadGalleryData();
    });
  }

  _login() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (_) => const SmsLoginPage()),
        )
        .then((val) => val != null ? _fresh() : null);
  }

  @override
  Widget build(BuildContext context) {
    if (Global.user.online()) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("我的画廊"),
          centerTitle: true,
          automaticallyImplyLeading: true,

        ),
        backgroundColor: Colors.white,
        body: _futureBuilder(),
      );
    }

    return TipView(
        msg: '登录进入我的画廊',
        ontap: () {
          _login();
        });
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
  _reload(){
    return TipView(msg: '网络出小差了，点击刷新', ontap: () {
      setState(() {
        _future = Global.user.loadGalleryData();
      });
    });
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
              if (async.hasError) {
                return _reload();
              } // return _buildError('请检查网络');
              if (async.hasData) {
                // return GalleryCardsView(data: async.data);
                return StaggerView(data: async.data);
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
