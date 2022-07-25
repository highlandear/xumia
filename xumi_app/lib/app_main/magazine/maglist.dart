import 'package:flutter/material.dart';
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

  buildError(String e) {
    return _buildFreshButton(context);
  }

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
      child: Container(
        child: _buildMagList(nlist)
      ),
    );
  }


  _buildMagList(nlist) {
    return PageView.builder(
      controller: pageController,
      itemCount: nlist.length,
      physics: const PageScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MagazinePageView(item: nlist[index]);
      },
      scrollDirection: Axis.vertical,
    );
  }

  Widget _buildFreshButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {
            setState(() {
              _future = Global.user.loadMagData();
            });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff44c5fe)),
          shape: MaterialStateProperty.all(
              const StadiumBorder(side: BorderSide.none)), //圆角弧度
        ),
        child: const Text(
          '刷新',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
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
              if (async.hasError){
                return buildError('请检查网络');}
              if (async.hasData) {

             //   return _buildMagList(async.data);
                return _buildPageView(async.data);
              }
              return buildError('e2');
            }
          default:
            return buildError('e3');
        }
      },
      future: _future,
    );
  }
}
