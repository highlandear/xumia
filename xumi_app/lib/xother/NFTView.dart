import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xumi_app/bean/user_info.dart';
import '../data/global.dart';
import '../utils/local_util.dart';

class NFTView extends StatefulWidget {
  NFTView({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  State<StatefulWidget> createState() {
    return NFTViewState();
  }
}

class NFTViewState extends State<NFTView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this.showNFT(),
        //  this.getUserAndTitle()
        this.showBuyButton(context),
      ],
    );
  }

  Widget showBuyButton(BuildContext context) {
    return Positioned(
      bottom: 5.0, //距离底边18px（中间左边）
      right: 165,
      child: InkWell(
        onTap: () {
            print(widget.index);
            UserInfo ui = UserInfo(
              did:'test',
              tel:'10'
            );
          //  AStorage.setv('me', jsonEncode(Global.mydata.me.toJson()));
            AStorage.setv('me', jsonEncode(ui.toJson()));
            AStorage.getv('me').then((value) => {
              // if(value == null)
              print('null===== $value')
            });
        },
        child: Container(
          height: 48,
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 2,
            bottom: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            //   border: Border.all(color: Colors.grey.withOpacity(0.2)),
            border: Border.all(color: Colors.blue),
          ),
          child: Icon(
            Icons.add,
            color: Colors.blue,
            size: 28,
          ),
        ),
      ),
    );
  }

  // 视频播放(假的不是重点)
  Widget showNFT() {
    return Container(
      color: Colors.white,
      child: Center(
       // child: Image.network(Global.mydata.nlist[widget.index].path),
      ),
    );
  }
/*
  Widget getMusicTitle() {
    return Container(
      // color: Colors.red,
      // alignment: Alignment.centerLeft,
      child: Text(
        "三根皮带歌曲,哗啦啦啦啦啦啦啦啦啦啦啦",
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

 */
/*
  Widget getUserAndTitle() {
    return Positioned(
      bottom: 60,
      child: Padding(
        padding: EdgeInsets.only(left: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                '@' + Global.mydata.nlist[widget.index].owner,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              width: 250,
              child: Text(Global.mydata.nlist[widget.index].desc,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            Container(
              // color: Colors.red,
              // alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 5),
              width: 200,
              height: 25,
              child: ListView(
                physics: new NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                //  children: <Widget>[this.getMusicTitle()],
              ),
            )
          ],
        ),
      ),
    );
  }

 */
  test(){
    //Map<String,String> para = {'username': 'hzs', 'password':'qwert'};
    //Http.http.post('http://10.0.0.6:8080/logout.do', parameters: para, onSuccess: (t) { print('******************'); print(t.toString()); }, onError: (String error) {  });
    // AHttp.http.get(Config.LOGIN).then((value) => {print(value.toString())});
    //AHttp.http.post(Config.LOGOUT, parameters:para).then((value) => {print(value.toString())});
  }
}
