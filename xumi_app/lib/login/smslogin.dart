import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/global.dart';
import '../utils/xtoast.dart';
import '../utils/loading.dart';
//
class Login {
  static Future login(BuildContext context) async{
    if (Global.user.online()) return;

   return Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const SmsLoginPage()));
  }
}

/// 手机号快速登录，短信验证
class SmsLoginPage extends StatefulWidget {
  const SmsLoginPage({Key? key}) : super(key: key);

  @override
  createState() => _SmsLoginState();
}

class _SmsLoginState extends State<SmsLoginPage> {

  bool isButtonEnable = true; //按钮初始状态  是否可点击
  String buttonText = '发送验证码'; //初始文本
  int count = 60; //初始倒计时时间
  Timer? timer; //倒计时的计时器
  FocusNode blankNode = FocusNode();
  final TextEditingController _veriController = TextEditingController();
  final TextEditingController _telController = TextEditingController();

  @override
  void initState() {

    _telController.text = Global.user.getPhone();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('手机号快速登录'),
      ),
      body: _buildLogin(context),
    );
  }


  Widget _buildAccountInput(BuildContext context) {
    return TextFormField(
        autofocus: false,
        controller: _telController,
        decoration: const InputDecoration(
            labelText: '手机号',
            hintText: '手机号',
            hintStyle: TextStyle(fontSize: 12),
            icon: Icon(Icons.phone)),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")), //只允许输入0-9的数字
          LengthLimitingTextInputFormatter(11) //最大输入长度为6
        ],
        //校验用户名
        validator: (v) {
          debugPrint(v);
        });
  }

  Widget _buildVerifyInput(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: <Widget>[
          const Text('验证码',
              style: TextStyle(fontSize: 13, color: Color(0xff333333))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                maxLines: 1,
                onSaved: (value) {},
                controller: _veriController,
                textAlign: TextAlign.start,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(6) //最大输入长度为6
                ],
                decoration: const InputDecoration(
                  hintText: ('填写验证码'),
                  contentPadding: EdgeInsets.only(top: 25, bottom: 0),
                  hintStyle: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 13,
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: FlatButton(
              disabledColor: Colors.grey.withOpacity(0.1), //按钮禁用时的颜色
              disabledTextColor: Colors.white, //按钮禁用时的文本颜色
              textColor: isButtonEnable
                  ? Colors.white
                  : Colors.black.withOpacity(0.2), //文本颜色
              color: isButtonEnable
                  ? const Color(0xff44c5fe)
                  : Colors.grey.withOpacity(0.1), //按钮的颜色
              splashColor: isButtonEnable
                  ? Colors.white.withOpacity(0.1)
                  : Colors.transparent,
              shape: const StadiumBorder(side: BorderSide.none),
              onPressed: () {
                if (isButtonEnable) {
                  debugPrint('$isButtonEnable');
                  setState(() {
                    _buttonClickListen();
                  });
                }
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {
          debugPrint(_veriController.text);
          debugPrint(_telController.text);

          _onSubmit(context);
        },
        style: ButtonStyle(
      //    backgroundColor: MaterialStateProperty.all(const Color(0xff44c5fe)),
          shape: MaterialStateProperty.all(
              const StadiumBorder(side: BorderSide.none)), //圆角弧度
        ),
        child: const Text(
          '登录',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildLogin(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildAccountInput(context),
        _buildVerifyInput(context),
        _buildButton(context),
      ],
    );
  }

  void _buttonClickListen() {
    setState(() {
      if (isButtonEnable) {
        //当按钮可点击时
        isButtonEnable = false; //按钮状态标记
        _initTimer();
      }
    });
  }

  void _initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      count--;
      setState(() {
        if (count == 0) {
          timer.cancel(); //倒计时结束取消定时器
          isButtonEnable = true; //按钮可点击
          count = 60; //重置时间
          buttonText = '发送验证码'; //重置按钮文本
        } else {
          buttonText = '重新发送($count)'; //更新文本内容
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); //销毁计时器
    timer = null;
    _veriController.dispose();
    _telController.dispose();
    super.dispose();
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

    Global.user.reqLogin(_telController.text, '', success: () {
    //  XToast.toast('登录成功');
      Navigator.pop(context);
      Navigator.pop(context, true);
    }, fail: (value) {
      XToast.error('登录失败，网络异常($value)');
      Navigator.pop(context);
    });
  }
}
