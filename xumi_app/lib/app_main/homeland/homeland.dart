import 'package:flutter/material.dart';
import '../../data/colors.dart';
import '../../data/global.dart';
import '../../login/smslogin.dart';
import '../../utils/tip.dart';
import '../../utils/xqrscan.dart';
import '../../utils/xtoast.dart';
import 'drawerhead.dart';

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
          color: MineColors.xumi_gray,
          //  color: Colors.brown,
          // child: const Image(
          //     image: NetworkImage(
          //         'http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg')),
        ),
        _buildLand(),
      ],
    );
  }

  _buildCLickButton(String name, String background) {
    return InkWell(
      child: Stack(
        children: [
          ClipRRect(
              child: Image(image: NetworkImage(background)),
              borderRadius: BorderRadius.circular(10)),
          Center(
            child: Text(name,
                style: const TextStyle(
                    fontSize: 40, letterSpacing: 20, color: Colors.grey)),
          ),
        ],
      ),
      onTap: () {
        XToast.toast(name);
      },
    );
  }

  _buildLand() {
    return ListView(
      children: [
        const SizedBox(
          width: 80,
          height: 60,
        ),
        _buildCLickButton('家园', 'http://www.cognitivelab.net/imgs/home-1.png'),
        const Divider(),
        _buildCLickButton('乐园', 'http://www.cognitivelab.net/imgs/home-6.png'),
        const Divider(),
        _buildCLickButton('旅途', 'http://www.cognitivelab.net/imgs/home-4.png'),
      ],
    );
  }

  _fresh() {
    setState(() {});
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
    if (!Global.user.online()) {
      return TipView(
          msg: '登录进入我的家园',
          ontap: () {
            _login();
          });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MineColors.xumi_gray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue, size: 40),
        actions: [
          IconButton(
            icon: const Image(
              image: AssetImage('assets/images/find/find_scan.png'),
            ),
            iconSize: 18,
            onPressed: _onTap,
          ),
        ],
      ),
      body: _buildHead(context),
      drawer: const DrawerHeadInfo(),
    );
  }

  _onTap() {
    print('search....');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return (const BarcodeScanPage());
    }));
  }
}
