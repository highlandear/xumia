import 'package:flutter/material.dart';

//loading加载框
class LoadingDialog extends Dialog {
  static showLoading(BuildContext context){
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
  }
  const LoadingDialog(
      {Key? key,
      required this.loadingView,
      this.content = "加载中...",
      this.showContent = true,
      this.radius = 10,
      this.backgroundColor = Colors.white})
      : super(key: key);

  //loading动画
  final Widget loadingView;
  //提示内容
  final String content;
  //是否显示提示文字
  final bool showContent;
  //圆角大小
  final double radius;
  //背景颜色
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: showContent ? 120 : 80,
          height: showContent ? 120 : 80,
          child: Container(
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                loadingView,
                showContent
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Text(content),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
