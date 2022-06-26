import 'package:flutter/material.dart';
import '../../data/global.dart';
import 'leaf.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(keepPage: false);

  final Future _future = Global.user.loadMagData();

  @override
  void initState() {
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
    return Center(
      child: Text(e),
    );
  }

  buildItem(_nlist) {
    return PageView.builder(
      controller: pageController,
      itemCount: _nlist.length,
      physics: const PageScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MagLeafView(item: _nlist[index]);
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
              if (async.hasError){
                return buildError('请检查网络');}
              if (async.hasData) {
                return buildItem(async.data);
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