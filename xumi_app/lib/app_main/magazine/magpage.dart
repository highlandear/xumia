import 'package:flutter/material.dart';
import '../../bean/certipass.dart';
import 'buypage.dart';

class MagazinePageView extends StatelessWidget {
  const MagazinePageView({Key? key, required this.item}) : super(key: key);
  final CertiPass item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _showMagItem(context),
        _showBuyButton(context),
      ],
    );
  }

  Widget _showMagItem(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width, // 屏幕宽度
      height: MediaQuery.of(context).size.height, // 屏幕高度
      child: Image.network(item.cover, fit: BoxFit.cover),
    );
  }

  Widget _showBuyButton(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 120,
      child: InkWell(
        onTap: () {
          _watchDetail(context);
        },
        child: Container(
            height: 48,
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 2,
              bottom: 0,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(color: Colors.blue),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              child: const Center(
                  child: Text(
                "点击查看详情",
                style: TextStyle(color: Colors.white),
              )),
            )),
      ),
    );
  }

  _watchDetail(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return (PurchasePage(item: item));
    }));
  }
}