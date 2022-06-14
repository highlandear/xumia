import 'package:flutter/material.dart';
import 'package:xumi_app/bean/nftdata.dart';
import '../../bean/user_info.dart';
import '../../data/global.dart';
import '../login/signup.dart';

class MagLeafView extends StatelessWidget {
  MagLeafView({Key? key, required this.item}) : super(key: key);
  NFTData item;
  final UserInfo me = Global.mydata.me;

  _buyItem(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return (RegisterPage());
    }));
    print('${me.username} buy this one, ${item.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this._showMagItem(),
        this._showBuyButton(context),
      ],
    );
  }
  Widget _showMagItem() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.network(item.path),
      ),
    );
  }
  Widget _showBuyButton(BuildContext context) {
    return Positioned(
      bottom: 5.0,
      right: 165,
      child: InkWell(
        onTap: () {
          _buyItem(context);
        },
        child: Container(
          height: 48,
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 2,
            bottom: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            border: Border.all(color: Colors.blue),
          ),
          child: Icon(
            Icons.add,
            color: Colors.blue,
            size: 28,
          ),
        ),
      ),
    );
  }
}