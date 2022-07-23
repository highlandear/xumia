import 'package:flutter/material.dart';
import '../../data/colors.dart';
import 'item.dart';

class ListClickItem extends StatefulWidget {
  const ListClickItem({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  final ClickItem model;
  final void Function(ClickItem model) onTap;

  @override
  _ListClickItemState createState() => _ListClickItemState();
}

class _ListClickItemState extends State<ListClickItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          widget.onTap(widget.model);
        },
        child: _stack(),
      ),
    );
  }

  Stack _stack() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: _container(),
        ),
        const Positioned(
          bottom: 0,
          height: 1,
          left: 60,
          right: 0,
          child: Divider(
            color: MineColors.xumi_gray,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Container _container() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: _row(),
      ),
      color: Colors.white,
    );
  }

  Row _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image(image: AssetImage(widget.model.imageName)),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Text(
              widget.model.title,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
        const Expanded(child: Padding(padding: EdgeInsets.zero)),
      ],
    );
  }
}
