import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:xumi_app/bean/deliverdata.dart';
import '../../data/config.dart';
import '../../utils/xhttp.dart';
import '../../utils/xtoast.dart';
import '../bean/userinfo.dart';
import '../data/global.dart';
import 'loading.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key, required this.title, this.itemid = ''})
      : super(key: key);

  final String title;
  final String itemid;

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  FocusNode blankNode = FocusNode();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();
  late String area = '';
  final UserInfo _me = Global.mydata.me;

  @override
  Widget build(BuildContext context) {
    _telController.text = _me.online() ? _me.tel : '';
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GestureDetector(
        onTap: () {
          closeKeyboard(context);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: buildForm(context),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          TextFormField(
              autofocus: false,
              controller: _telController,
              decoration: const InputDecoration(
                  labelText: '手机号',
                  hintText: '手机号',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.phone)),
              //校验用户名
              validator: (v) {}),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: '收件人',
                  hintText: '收件人',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {}),
          Container(
            padding: const EdgeInsets.only(left: 5),
            height: 68,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: InkWell(
              child: Row(
                children: <Widget>[
                  const Icon(Icons.place),
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
                    cancelWidget:
                        const Text("取消", style: TextStyle(color: Colors.blue)),
                    confirmWidget:
                        const Text("确定", style: TextStyle(color: Colors.blue)));

                print(result);
                setState(() {
                  area =
                      "${result?.provinceName}/${result?.cityName}/${result?.areaName}";
                });
              },
            ),
          ),
          TextFormField(
              autofocus: false,
              controller: _detailController,
              decoration: const InputDecoration(
                  labelText: '详细',
                  hintText: '详细',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.house)),
              //校验用户名
              validator: (v) {}),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15.0)),
                    child:
                        const Text('提交', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        _onSubmit(context);
                      }
                    },
                  );
                })),
              ],
            ),
          )
        ],
      ),
    );
  }

  getSignInfo() {
    DeliverData ud = DeliverData(
        tel: _telController.text,
        name: _unameController.text,
        address: area,
        detail: _detailController.text);
    return ud.toJson();
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  void _onSubmit(BuildContext context) {
    closeKeyboard(context);

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
    // XHttp.instance.postJson(Config.sign, params: {}).then((val) {
    XHttp.instance
        .postData(Config.postAddr,
            params: {'username': _me.tel, 'itemid': widget.itemid},
            data: getSignInfo())
        .then((val) {
      print(val);
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
        Global.mydata.house = DeliverData.fromJson(jsonDecode(val)['data']);
        print(jsonDecode(val)['data']);
        print(Global.mydata.house.address);
        XToast.toast('地址添加成功');
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        XToast.error("该用户名已注册");
        Navigator.pop(context);
      }
    });
  }
}
