import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';
import '../data/config.dart';
import '../login/loading.dart';
import '../utils/xhttp.dart';
import '../utils/xtoast.dart';
import 'jdtext.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({Key? key}) : super(key: key);

  @override
  _AddressAddPageState createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  String area = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("请填写基本信息"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              JdText(
                text: "收货人姓名",
              ),
              const SizedBox(height: 10),
              JdText(
                text: "收货人电话",
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 5),
                height: 68,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.add_location),
                      area.isNotEmpty
                          ? Text(area,
                              style: const TextStyle(color: Colors.black54))
                          : const Text('省/市/区',
                              style: TextStyle(color: Colors.black54))
                    ],
                  ),
                  onTap: () async {
                    Result? result = await CityPickers.showCityPicker(
                        context: context,
                        cancelWidget: const Text("取消",
                            style: TextStyle(color: Colors.blue)),
                        confirmWidget: const Text("确定",
                            style: TextStyle(color: Colors.blue)));

                    print(result);
                    setState(() {
                      area =
                          "${result?.provinceName}/${result?.cityName}/${result?.areaName}";
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              JdText(
                text: "详细地址",
                maxLines: 4,
                height: 200,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 40),
              _button(context, '增加'),
            ],
          ),
        ));
  }

  _button(BuildContext context, text) {
    return ElevatedButton(
        style: TextButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(15.0)),
        child: Text(text, style: const TextStyle(color: Colors.white)),
        onPressed: () {});
  }

  void _onSubmit(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: CircularProgressIndicator(),
          );
        });
    XHttp.instance.postJson(Config.signReq, data: {}).then((val) {
      var erode = jsonDecode(val)['errorCode'];
      if (erode == 0) {
        XToast.toast('注册成功');
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        XToast.error("该用户名已注册");
        Navigator.pop(context);
      }
    });
  }
}
