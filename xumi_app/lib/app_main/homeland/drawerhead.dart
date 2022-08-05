import 'package:flutter/material.dart';

import '../../data/global.dart';
import '../../login/addresslist.dart';
import '../../login/smslogin.dart';
import '../../utils/xqrgen.dart';
import 'listtileitem.dart';

class DrawerHeadInfo extends StatefulWidget {
  const DrawerHeadInfo({Key? key}) : super(key: key);

  @override
  createState() => _DrawerHeadInfoState();
}

class _DrawerHeadInfoState extends State<DrawerHeadInfo> {
  _ontap(BuildContext context, String title) {
    switch (title) {
      case '退出':
        Global.user.logout();
        Navigator.pop(context, true);
        break;
      case '设置':
        break;
      case '地址管理':
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (const MyAddressListPage());
        }));
        break;
      default:
        break;
    }

    //  XToast.toast(title);
  }

  _buildOperations(BuildContext context) {
    return Column(
      children: ListTileItem.toWidgetList(
          context: context,
          list: [
            // ListTileItem(title: '我的二维码', icon: Icons.qr_code),
            // ListTileItem(title: '扫码', icon: Icons.qr_code_scanner),
            ListTileItem(title: '护照信息', icon: Icons.language_outlined),
            ListTileItem(title: '地址管理', icon: Icons.house),
            ListTileItem(title: ''),
            ListTileItem(title: '设置', icon: Icons.settings),
            ListTileItem(title: ''),
            ListTileItem(title: '退出', icon: Icons.logout),
          ],
          tap: _ontap),
    );
  }

  String _getMyName() {
    return Global.user.online() ? '用户[${Global.user.getPhone()}]' : '请点击头像登录';
  }

  String _getMyCode() {
    return Global.user.online() ? '5eaee21f5188256da0323bf9' : '';
  }

  _getMyImage() {
    if (Global.user.online()) {
      return const NetworkImage(
          'https://images.cnblogs.com/cnblogs_com/JobsOfferings/1363202/o_preview.jpg');
    }
    return const AssetImage('assets/images/mine/mine.png');
  }

  _login() {
    if (Global.user.online()) {
      return;
    }

    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (_) => const SmsLoginPage()),
        )
        .then((val) => val != null ? setState(() {}) : null);
  }

  _buildCodeInfo(BuildContext context) {
    if (!Global.user.online()) {
      return const InkWell();
    }

    return InkWell(
      child: Row(
        children: [
          Text(_getMyCode()),
          const Icon(Icons.qr_code),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (const QRPage(
              '我的二维码', 'http://cognitivelab.net/xumi-app.apk'));
        }));
      },
    );
  }

  _buildHeadInfo(BuildContext context) {
    return InkWell(
      child: UserAccountsDrawerHeader(
          accountName: Text(_getMyName(),
              style: const TextStyle(fontWeight: FontWeight.bold)),
          accountEmail: _buildCodeInfo(context),
          currentAccountPicture: CircleAvatar(
            backgroundImage: _getMyImage(),
          ),
          // 圆角头像
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const NetworkImage(
                      'http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.7), BlendMode.hardLight)))),
      onTap: () {
        _login();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      _buildHeadInfo(context),
      _buildOperations(context),
    ]));
  }
}
