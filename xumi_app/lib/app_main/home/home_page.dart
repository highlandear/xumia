import 'package:flutter/material.dart';
import '../../data/global.dart';
import 'mag_leaf.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = new PageController(keepPage: false);

  Future _future = Global.mydata.loadData();

  var _nlist = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: this.futureBuilder(),
    );
  }

  buildWaiting() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  buildError(String e) {
    return new Center(
      child: new Text(e),
    );
  }

  buildItem() {
    return Container(
      child: PageView.builder(
        controller: pageController,
        itemCount: _nlist.length,
        physics: PageScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MagLeafView(item: _nlist[index]);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

  FutureBuilder futureBuilder() {
    return new FutureBuilder(
      builder: (context, AsyncSnapshot async) {
        switch (async.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
              return buildWaiting();
          case ConnectionState.done:
            {
              if (async.hasError) return buildError('请检查网络');
              if (async.hasData) {
                _nlist = async.data;
                return buildItem();
              }
              return buildError('e2');
            }
          default:
            return buildError('e3');
        }
      },
      future: this._future,
    );
  }
}