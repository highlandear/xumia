import 'package:flutter/cupertino.dart';
import 'package:xumi_app/app_main/mode/item.dart';

import 'list_item.dart';

class ItemModelView extends StatelessWidget {
  ItemModelView(this._models, this._ontap);

  List<ClickItem> _models;

  Function _ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItems(context),
    );
  }

  _buildItems(BuildContext context) {
    List<Widget> _items = [];
    _models.forEach((model) {
      if (model.type == 'divid') {
        _items.add(Padding(
          padding: EdgeInsets.only(top: 10),
        ));
      } else {
        _items.add(
          Container(
            height: 60.0,
            child: ListClickItem(
              model: model,
              onTap: (model) {
                _ontap(context, model.type);
                print('${model.title}');
              },
            ),
          ),
        );
      }
    });
    return _items;
  }
}
