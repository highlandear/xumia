import 'package:flutter/material.dart';
import 'package:xumi_app/utils/http_util.dart';
import '../bean/nftdata.dart';
import '../data/config.dart';
import '../data/global.dart';
import '../utils/request_data.dart';
import 'NFTView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = new PageController(keepPage: false);
  late Future future;

  @override
  void initState() {
    future = loadData();
    super.initState();
  }

  Future loadData() async {
   // return RequestData(Config.LOGIN).request();
   // var res = await AHttp.http.get(Config.LOGIN);
    return NFTData.listfromJson(await AHttp.http.get(Config.LOGIN));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: this.futureBuilder(),
      ),
    );
  }

  FutureBuilder futureBuilder() {
    return new FutureBuilder(
      builder: (context, AsyncSnapshot async) {
        //在这里根据快照的状态，返回相应的widget
        if (async.connectionState == ConnectionState.active ||
            async.connectionState == ConnectionState.waiting) {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
        if (async.connectionState == ConnectionState.done) {
          debugPrint("done");
          if (async.hasError) {
            return new Center(
              child: new Text("ERROR"),
            );
          }
          else if (async.hasData) {
          //  Global.mydata.nlist = NFTData.listfromJson(async.data);
            Global.mydata.nlist = async.data;
            print(async.data);
            return Container(
              child: PageView.builder(
                controller: pageController,
                itemCount: Global.mydata.nlist.length,
                // reverse: false,
                physics: PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  print(Global.mydata.nlist.length);
                  return NFTView(index: index);
                },
                scrollDirection: Axis.vertical,
              ),
            );

          }
          else{
            return new Center(
              child: new Text("ERROR"),
            );
          }
        }
        else{
          return new Center(
            child: new Text("ERROR"),
          );
        }
      },
      future: this.future,
    );
  }
}
