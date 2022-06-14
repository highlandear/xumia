import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/config.dart';
import '../../utils/xhttp.dart';
import '../../utils/xtoast.dart';
import 'loading.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // 响应空白处的焦点的Node
  bool _isShowPassWord = false;
  bool _isShowPassWordRepeat = false;
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _pwdRepeatController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注册')),
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
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                /* return v.trim().length > 0
                    ? null
                    : I18n.of(context).loginNameError;
                */
                print('name error');
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: 'passwd',
                  hintText: 'enter passwd',
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
                /*
                return v.trim().length >= 6
                    ? null
                    : I18n.of(context).passwordError;

                 */
                print('error');
              }),

          TextFormField(
              controller: _pwdRepeatController,
              decoration: InputDecoration(
                  labelText: '再次输入',
                  hintText: 'repeat enter passwd',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWordRepeat
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWordRepeat)),
              obscureText: !_isShowPassWordRepeat,
              //校验密码
              validator: (v) {
                /*
                return v.trim().length >= 6
                    ? null
                    : I18n.of(context).passwordError;

                 */
                print('pwd error');
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
                    child: Text('I18n.of(context).register',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        onSubmit(context);
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

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  ///点击控制密码是否显示
  void showPassWordRepeat() {
    setState(() {
      _isShowPassWordRepeat = !_isShowPassWordRepeat;
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) {
    closeKeyboard(context);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: CircularProgressIndicator(),
          );
        });
    XHttp.instance.post(Config.SIGNUP, params: {
      'username': _unameController.text,
      'password': _pwdController.text
    }).then((val) {
      var erode = jsonDecode(val)['errorCode'];
      if(erode == 0)
      {
        XToast.toast('注册成功');
        Navigator.pop(context);
        Navigator.pop(context);
      }
      else{
        XToast.error("该用户名已注册");
        Navigator.pop(context);
      }
    });
  }
}