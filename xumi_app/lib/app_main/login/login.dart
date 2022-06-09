import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/login/signup.dart';
import '../../bean/user_info.dart';
import '../../data/config.dart';
import '../../data/global.dart';
import '../../utils/http_util.dart';
import '../../utils/toast_util.dart';
import 'loading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: _leading(context),
        title: Text('登录'),
        actions: <Widget>[
          TextButton(
            child: Text(' 注册', style: TextStyle(color: Colors.white)),
            onPressed: () {
              print('注册页面');
              // Get.to(() => RegisterPage());
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
          Center(
              heightFactor: 1.5,
              child: FlutterLogo(
                size: 64,
              )),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: InputDecoration(
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
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.lock),
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
                        padding: EdgeInsets.all(15.0)),
                    child: Text('I18n.of(context).login',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        _onSubmit(context);
                      }
                      print('onpress ');
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
          return LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            //   loadingView: SpinKitCircle(color: Colors.white),
            loadingView: CircularProgressIndicator(),
          );
        });
    XHttp.instance
        .post(Config.LOGIN, params: {
          'username': _unameController.text,
          'password': _pwdController.text
        })
        .then((data) => {
              print(data.toString()),
              Global.mydata.me = UserInfo.fromJson(jsonDecode(data)),
              Navigator.pop(context),
              XToast.error('test'),
              // Navigator.pop(context),
              Navigator.pop(context, true),
            })
        .catchError((onError) {
          Navigator.of(context).pop();
          XToast.error('bad network');
        });
/*
    XHttp.instance.post(Config.LOGIN, params: {
      'username': _unameController.text,
      'password': _pwdController.text
    }).then((data) => {
      print(data.toString()),
          Global.mydata.me = UserInfo.fromJson(jsonDecode(data)),
          Navigator.pop(context),
    XToast.error('test'),
         // Navigator.pop(context),
          Navigator.pop(context,true),
        });

 */
    /*
    UserProfile userProfile = Provider.of<UserProfile>(context, listen: false);

    XHttp.post("/user/login", {
      "username": _unameController.text,
      "password": _pwdController.text
    }).then((response) {
      Navigator.pop(context);
      if (response['errorCode'] == 0) {
        userProfile.nickName = response['data']['nickname'];
        ToastUtils.toast(I18n.of(context).loginSuccess);
        Get.off(() => MainHomePage());
      } else {
        ToastUtils.error(response['errorMsg']);
      }
    }).catchError((onError) {
      Navigator.of(context).pop();
      ToastUtils.error(onError);
    });
    */
  }
}
