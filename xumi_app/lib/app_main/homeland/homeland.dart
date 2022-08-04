import 'package:flutter/material.dart';
import 'package:xumi_app/data/global.dart';

import '../../data/colors.dart';
import '../../login/smslogin.dart';
import '../../utils/tip.dart';
import 'drawhead.dart';

class HomeLandView extends StatefulWidget {
  const HomeLandView({Key? key}) : super(key: key);

  @override
  createState() => _HomeLandViewState();
}

class _HomeLandViewState extends State<HomeLandView> {
  _buildHead(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MineColors.xumi_black,
          // child: const Image(
          //     image: NetworkImage(
          //         'http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg')),
        ),
        _buildLand(),
      ],
    );
  }

  _buildLand() {
    return ListView(
      children: const [
        SizedBox(
          width: 80,
          height: 180,
          // child: Image(
          //   image: AssetImage('assets/images/mine/mine.png'),
          // ),
        ),
        Image(image: NetworkImage('http://www.cognitivelab.net/imgs/home-1.png')),
        Divider(),
        Image(image: NetworkImage('http://www.cognitivelab.net/imgs/home-2.png')),
        Divider(),
        Image(image: NetworkImage('http://www.cognitivelab.net/imgs/home-3.png')),
        //  Image(image: NetworkImage('http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg')),
      ],
    );
  }
  _fresh() {
    setState(() {
    //  _future = Global.user.loadGalleryData();
    });
  }

  _login() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(builder: (_) => const SmsLoginPage()),
    )
        .then((val) => val != null ? _fresh() : null);
  }
  @override
  Widget build(BuildContext context) {
    if(! Global.user.online()) {
      return TipView(
          msg: '登录进入我的家园',
          ontap: () {
            _login();
          });
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MineColors.xumi_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 背景颜色设置为透明
        shadowColor: Colors.transparent, // 阴影也要设置为透明
        elevation: 0,
      ),
      body: _buildHead(context),
      drawer: const DrawerHead(),
    );
  }

  _buildDrawer() {
    return Drawer(
      backgroundColor: MineColors.xumi_gray,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //侧拉菜单头部
          const DrawerHeader(
            child: Text('护照信息'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: const Text('内容1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('内容2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildx(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // 背景颜色设置为透明
          shadowColor: Colors.transparent, // 阴影也要设置为透明
          elevation: 0,
          //  title: Text('家园'),
        ),
        drawer: _buildDrawer(),
        body: _buildLand(),
      ),
    );
  }
}
