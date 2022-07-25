import 'package:flutter/material.dart';
import 'package:xumi_app/utils/tip.dart';
import 'package:xumi_app/utils/xtoast.dart';
import '../../data/global.dart';
import 'magpage.dart';

class MagLisView extends StatefulWidget {
  const MagLisView({Key? key}) : super(key: key);

  @override
  createState() => _MagLisViewState();
}

class _MagLisViewState extends State<MagLisView> {
  PageController pageController = PageController(keepPage: false);

  Future _future = Global.user.loadMagData();

  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.position.pixels ==
          pageController.position.maxScrollExtent) {
        print('滑动到了最底部');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _futureBuilder(),
    );
  }

  buildWaiting() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  /// 重新加载本页面
  _reload() {
    return TipView(msg: '网络出小差了，点击刷新', ontap: () {
      setState(() {
        _future = Global.user.loadMagData();
      });
    });
  }

  _loadError(String e){
    XToast.error(e);
  }

  /// 下拦刷新的响应
  Future _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _future = Global.user.loadMagData();
      setState(() {});
    });
  }

  Widget _buildPageView(nlist) {
    return RefreshIndicator(
      //下拉刷新触发方法
      onRefresh: _onRefresh,
      //设置listView
      child: Container(child: _buildMagList(nlist)),
    );
  }

  _buildMagList(list) {
    return PageView.builder(
      controller: pageController,
      itemCount: list.length,
      physics: const PageScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MagazinePageView(item: list[index]);
      },
      scrollDirection: Axis.vertical,
    );
  }

  FutureBuilder _futureBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot async) {
        switch (async.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return buildWaiting();
          case ConnectionState.done:
            {
              if (async.hasError) {
                return _reload();
              }
              if (async.hasData) {
                return _buildPageView(async.data);
              }
              return _loadError('e2');
            }
          default:
            return _loadError('e3');
        }
      },
      future: _future,
    );
  }
}
