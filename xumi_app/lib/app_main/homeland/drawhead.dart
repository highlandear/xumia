import 'package:flutter/material.dart';

class DrawerHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer( // 重要的Drawer组件
      child: ListView( // Flutter 可滚动组件
        padding: EdgeInsets.zero, // padding为0
        children: <Widget>[
          UserAccountsDrawerHeader(
            // UserAccountsDrawerHeader 可以设置用户头像、用户名、Email 等信息，显示一个符合纸墨设计规范的 drawer header。
            // 标题
            accountName: const Text('Jobsofferings',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // 副标题
            accountEmail: Text('https://juejin.im/user/5eaee21f5188256da0323bf9'),
            // Emails
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.cnblogs.com/cnblogs_com/JobsOfferings/1363202/o_preview.jpg'),
            ),
            // 圆角头像
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: const NetworkImage(
                        'http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg'),
                    fit: BoxFit.cover, // 一种图像的布局方式
                    colorFilter: ColorFilter.mode(
                        Colors.grey[400]!.withOpacity(0.6),
                        BlendMode.hardLight))
            ),
            //  BoxDecoration 用于制作背景
          ),
          // ListTile是下方的几个可点按List
          ListTile(
            // List标题
            title: const Text('details', textAlign: TextAlign.right),
            trailing: const Icon(
              Icons.favorite, // Icon种类
              color: Colors.black12, // Icon颜色
              size: 22.0, // Icon大小
            ),
            // 点按时间，这里可以做你想做的事情，如跳转、判断等等
            // 此处博主只使用了 Navigator.pop(context) 来手动关闭Drawer
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Favorite', textAlign: TextAlign.right),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Settings', textAlign: TextAlign.right),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
