import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xumi_app/bean/nftdata.dart';

class MagItemView extends StatefulWidget {
  MagItemView({Key? key, required this.item}) : super(key: key);
  NFTData item;
  @override
  State<StatefulWidget> createState() {
    return _MagItemViewState();
  }
}

class _MagItemViewState extends State<MagItemView> {
  @override
  void initState() {
    super.initState();
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
       // child: Image.network(Global.mydata.nlist[widget.index].path),
        child: Image.network(widget.item.path),
      ),
    );
  }

  Widget _showBuyButton(BuildContext context) {
    return Positioned(
      bottom: 5.0, //距离底边18px（中间左边）
      right: 165,
      child: InkWell(
        onTap: () {
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
            //   border: Border.all(color: Colors.grey.withOpacity(0.2)),
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
