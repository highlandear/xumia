import 'dart:convert';
import 'package:flutter/material.dart';
import '../../data/config.dart';
import '../../utils/xhttp.dart';
import '../../utils/xtoast.dart';
import '../bean/userinfo.dart';
import '../data/global.dart';
import 'loading.dart';

/**
 * 快速登录
 */
class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  FocusNode blankNode = FocusNode();
  final TextEditingController _telController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String area = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('快速登录')),
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
                    const Text('验证并注册', style: TextStyle(color: Colors.white)),
                    onPressed: () {
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
    XHttp.instance.post(Config.signReq, params: {
      'username': _telController.text,
      'password': '',
    }).then((val) {
   //   print(val);
      var erode = jsonDecode(val)['status'];
      if (erode == '0') {
     //   print(jsonDecode(val)['data']);
        Global.mydata.me = UserInfo.fromJson(jsonDecode(val)['data']);
        XToast.toast('注册成功');
        Navigator.pop(context);
        Navigator.pop(context, true);
      } else {
        XToast.error("该用户名已注册");
        Navigator.pop(context);
      }
    });
  }
}
