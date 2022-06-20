import 'package:flutter/cupertino.dart';
import 'item.dart';
import 'list_item.dart';

class ItemModelView extends StatelessWidget {
  const ItemModelView(this._models, this._onTap, {Key? key}) : super(key: key);

  final List<ClickItem> _models;

  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItems(context),
    );
  }

  _buildItems(BuildContext context) {
    List<Widget> _items = [];
    for (var model in _models) {
      if (model.type == 'divide') {
        _items.add(const Padding(
          padding: EdgeInsets.only(top: 10),
        ));
      } else {
        _items.add(
          SizedBox(
            height: 60.0,
            child: ListClickItem(
              model: model,
              onTap: (model) {
                _onTap(context, model.type);
              },
            ),
          ),
        );
      }
    }
    return _items;
  }
}
