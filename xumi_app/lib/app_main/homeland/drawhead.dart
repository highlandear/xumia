import 'package:flutter/material.dart';

import '../../data/global.dart';
import '../../utils/xtoast.dart';
import '../mine/detail.dart';

class DrawerHead extends StatelessWidget {
  const DrawerHead({Key? key}) : super(key: key);

  _buildOperations(){
    return MyDetailView();
  }

  _buildHeadInfo(){
    return UserAccountsDrawerHeader(

      accountName: Text(Global.user.getPhone(),
          style: const TextStyle(fontWeight: FontWeight.bold)),

      accountEmail: const Text('5eaee21f5188256da0323bf9'),

      currentAccountPicture: const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://images.cnblogs.com/cnblogs_com/JobsOfferings/1363202/o_preview.jpg'),
      ),
      // 圆角头像
      decoration: const BoxDecoration(
        //   color: Colors.yellow[400],
        color: Colors.black26,
        // image: DecorationImage(
        //     image: const NetworkImage(
        //         'http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg'),
        //     fit: BoxFit.cover, // 一种图像的布局方式
        //     colorFilter: ColorFilter.mode(
        //         Colors.grey[400]!.withOpacity(0.6),
        //         BlendMode.hardLight))
      ),
      //  BoxDecoration 用于制作背景
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer( // 重要的Drawer组件
      child: ListView( // Flutter 可滚动组件
        padding: EdgeInsets.zero, // padding为0
        children: <Widget>[
          _buildHeadInfo(),
          // ListTile是下方的几个可点按List
          _buildOperations(),
      ]
      )
    );
  }
}
