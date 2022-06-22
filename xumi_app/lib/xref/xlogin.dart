import 'dart:convert';

import 'package:flutter/material.dart';
import '../login/newaddress.dart';
import '../../bean/userinfo.dart';
import '../../data/config.dart';
import '../../data/global.dart';
import '../../utils/xhttp.dart';
import '../../utils/xtoast.dart';
import '../login/loading.dart';
import 'xsignup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: _leading(context),
        title: const Text('登录'),
        actions: <Widget>[
          TextButton(
            child: const Text(' 注册', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return (RegisterPage());
              }));
            },
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          closeKeyboard(context);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: buildForm(context),
        ),
      ),
    );
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          const Center(
              heightFactor: 1.5,
              child: FlutterLogo(
                size: 64,
              )),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: 'user name',
                  hintText: 'Please enter your login name or email',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                /*  return v.trim().length > 0
                    ? null
                    : I18n.of(context).loginNameError;
               */
                print('error');
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'please enter passwd',
                  hintStyle: const TextStyle(fontSize: 12),
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWord
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord)),
              obscureText: !_isShowPassWord,
              //校验密码
              validator: (v) {
                /*return v.trim().length >= 6
                    ? null
                    : I18n.of(context).passwordError;

                 */
                print('error2');
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15.0)),
                    child: const Text('登录',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        _onSubmit(context);
                      }
                     // print('onpress ');
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

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
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
    XHttp.instance.post(Config.login, params: {
      'username': _unameController.text,
      'password': _pwdController.text
    }).then((val) {
      var erode = jsonDecode(val)['errorCode'];
      if (erode == 0) {
        XToast.toast('顺利登录');
        Global.user.info = UserInfo.fromJson(jsonDecode(val)['data']);
        Navigator.pop(context);
        Navigator.pop(context, true);
      } else if(erode == 1){
        XToast.error("请先注册");
        Navigator.pop(context);
      }
      else if(erode == 2){
        XToast.error("用户名密码不匹配");
        Navigator.pop(context);
      }
    });
  }
}
