import 'dart:io';
import 'package:flutter/material.dart';
import 'package:xumi_app/app_main/magazine/orderpage.dart';
import '../../bean/certipass.dart';
import '../../bean/useraddr.dart';
import '../../data/global.dart';
import '../../login/addresslist.dart';
import '../../login/smslogin.dart';
import '../../utils/xtoast.dart';

/// 详细展示和购买页面
class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key, required this.item}) : super(key: key);
  final CertiPass item;

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<PurchasePage>
    with SingleTickerProviderStateMixin {
  ///tab栏
  var tabs = <Tab>[];
  late TabController _tabController;
  late CertiPass _item;

  ///滑动监听
  final ScrollController _scrollController = ScrollController();
  final _goodHeight = 0.0;

  ///滑动多少距离显示顶部bar
  final _defaultScroller = 20;

  ///顶部bar的透明度，默认为透明，1为不透明
  double toolbarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    tabs = [
      const Tab(text: "商品"),
      const Tab(text: "详情"),
    ];

    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(() {
      ///如果滑动的偏移量超出了自己设定的值，tab栏就进行透明化操作
      double t = _scrollController.offset / _defaultScroller;
      if (t < 0.0) {
        t = 0.0;
      } else if (t > 1.0) {
        t = 1.0;
      }
      if (mounted) {
        setState(() {
          toolbarOpacity = t;
        });
      }

      ///如果滑动偏移量大于商品页高度，tab就切换到详情页
      if (_scrollController.offset >= _goodHeight) {
        _tabController.animateTo(1);
      } else {
        _tabController.animateTo(0);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }

  //计算商品信息页的高度
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///底部购买商品、购物车
      bottomNavigationBar: buildBottomBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                if (_item.desc.isNotEmpty) _buildDescCard(_item.desc),
                if (_item.detail.isNotEmpty) _buildDetailInfo(_item.detail),
              ],
            ),
          ),

          ///根据透明度显隐顶部的bar
          Opacity(
            opacity: toolbarOpacity,
            child: Container(
              height: 78,
              color: Colors.transparent,
              child: buildTopBar(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailInfo(detail) {
    return Image.network(detail);
  }

  Widget _buildDescCard(desc) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 20.0,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const Text('\n'),
            // Text('@${_item.owner}'),
            ListTile(
              title: Text(desc),
            )
          ],
        ),
      ),
    );
  }

  ///顶部
  AppBar buildTopBar() {
    double scale = MediaQuery.of(context).devicePixelRatio;
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Platform.isIOS
          ? GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: scale > 2 ? 0 : 10),
                child: const Icon(Icons.keyboard_arrow_left),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          : IconButton(
              padding: EdgeInsets.symmetric(vertical: scale > 3.0 ? 0 : 10),
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: TabBar(
        isScrollable: true,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(10),
        tabs: tabs,
        indicatorWeight: 3.5,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        controller: _tabController,
        onTap: (index) {
          if (_tabController.indexIsChanging) {
            switch (index) {
              case 0:
                _scrollController.jumpTo(0);
                _tabController.animateTo(0);
                break;
              case 1:
                _scrollController.jumpTo(_goodHeight);
                _tabController.animateTo(1);
                break;
            }
          }
        },
      ),
      centerTitle: true,
    );
  }

  ///创建底部操作栏
  BottomAppBar buildBottomBar() {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            // const Expanded(flex: 3, child: Text("联系客服")),
            Expanded(flex: 3, child: Text(_item.price)),
            _buildCartButton(context),
            _buildBuyButton(context),
          ],
        ),
      ),
    );
  }

  _buildCartButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          gradient: LinearGradient(colors: [
            Color(int.parse("ffff9b00", radix: 16)),
            Color(int.parse("ffF8CD6A", radix: 16)),
          ]),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        child: const Center(
            child: Text(
          "加入购物车",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  _buildBuyButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          _onBuyItem(context);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            gradient: LinearGradient(colors: [
              Color(int.parse("ffFF5252", radix: 16)),
              Color(int.parse("ffFF0000", radix: 16)),
            ]),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          child: const Center(
              child: Text(
            "购买",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

  _login() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SmsLoginPage()),
    );
  }

  _onBuyItem(BuildContext context) {
    if (!Global.user.online()) {
      return _login();
    }

    if (! _item.hasProduct()) {
      return _gotoOrderPage(context, null);
    }

    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (_) => const MyAddressListPage(sel: true)))
        .then((val) {
      if (val != null) _gotoOrderPage(context, val);
    });
    // 附带线下产品，本地有地址，要求用户选择已有地址
  }

  _gotoOrderPage(BuildContext context, address) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => OrderInfoPage(
                address: address,
                product: _item,
              )),
    );
  }
}
