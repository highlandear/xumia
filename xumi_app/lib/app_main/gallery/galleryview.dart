import 'package:flutter/material.dart';

import '../../bean/gnftdata.dart';
import 'cardlistview.dart';
import '../../data/global.dart';
import '../../login/smslogin.dart';
import '../../utils/tip.dart';
import 'stagger.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Future _future =
      Global.user.loadGalleryData(); // = Global.user.loadGalleryData();

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

  final _tabs = [
    const Tab(text: "全部"),
    const Tab(text: "画作"),
    const Tab(text: "会员卡"),
    const Tab(text: "门票"),
    const Tab(text: "数字头像"),
    const Tab(text: "游戏道具"),

  ];

  int gindex = 0;
  Widget _buildNormal(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TabBar(
                  indicatorColor: Colors.black,
                  isScrollable: true, //多个按钮可以滑动
                  tabs: _tabs,
                  onTap: (index) {
                    if (gindex == index) {
                      return;
                    }

                    setState(() {
                      gindex = index;
                    });
                  },
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          //   foregroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: _futureBuilder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Global.user.online()) {
      return _buildNormal(context);
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

  _reload() {
    return TipView(
        msg: '网络出小差了，点击刷新',
        ontap: () {
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
              //  return GalleryCardsView(data: async.data, type: gindex);
                return _buildStaggerGridView(async.data);
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

  _buildStaggerGridView(List<GNFTData> data) {
    List udata = [];
    if (gindex == 0) {
      //type==0表示全部
      udata = data;
    } else {
      for (var element in data) {
        if (element.type == gindex) {
          udata.add(element);
        }
      }
    }
    return StaggerView(data: udata);
  }
}
