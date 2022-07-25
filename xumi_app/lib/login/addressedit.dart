import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';
import '../../utils/xtoast.dart';
import '../bean/useraddr.dart';
import '../data/global.dart';
import '../utils/loading.dart';

/// 对地址进行修改
/// id == 0 时，表明新增加一个地址
/// id !=0 时，修改对应id的地址
class AddressEditPage extends StatefulWidget {
  const AddressEditPage({Key? key, this.id = 0}) : super(key: key);

  final int id;

  @override
  createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  FocusNode blankNode = FocusNode();
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  String _area = '';
  late AddressInfo address =
      widget.id == 0 ? AddressInfo() : Global.user.getAddressByID(widget.id);

  @override
  void initState() {
    _unameController.text = address.name;
    _detailController.text = address.detail;

    if (address.id == null) {
      _telController.text = Global.user.online() ? Global.user.getPhone() : '';
    } else {
      _telController.text = address.phone;
    }

    _area = address.prov.isEmpty
        ? '省/市/区(县)'
        : '${address.prov}/${address.city}/${address.dist}';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('编辑收货地址')),
      body: GestureDetector(
        onTap: () {
          closeKeyboard(context);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: buildForm(context),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          TextFormField(
              autofocus: false,
              controller: _telController,
              decoration: const InputDecoration(
                  labelText: '手机号',
                  hintText: '手机号',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.phone)),
              //校验用户名
              validator: (v) {}),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: '收件人',
                  hintText: '收件人',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {}),
          Container(
            padding: const EdgeInsets.only(left: 5),
            height: 68,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: InkWell(
              child: Row(
                children: <Widget>[
                  const Icon(Icons.place),
                  Text(_area, style: const TextStyle(color: Colors.black54))
                ],
              ),
              onTap: () {
                _citySelect();
              },
            ),
          ),
          TextFormField(
              autofocus: false,
              controller: _detailController,
              decoration: const InputDecoration(
                  labelText: '详细',
                  hintText: '详细',
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.house)),
              //校验用户名
              validator: (v) {}),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15.0)),
                    child:
                        const Text('提交', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)!.validate()) {
                        _onSubmit(context);
                      }
                    },
                  );
                })),
              ],
            ),
          )
        ],
      ),
    );
  }

  _citySelect() {
    CityPickers.showCityPicker(
            context: context,
            cancelWidget:
                const Text("取消", style: TextStyle(color: Colors.blue)),
            confirmWidget:
                const Text("确定", style: TextStyle(color: Colors.blue)))
        .then((value) {
      setState(() {
        if (value?.provinceName != null) {
          _area =
              '${value?.provinceName}/${value?.cityName}/${value?.areaName}';
          address.prov = '${value?.provinceName}';
          address.city = '${value?.cityName}';
          address.dist = '${value?.areaName}';
        }
      });
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  void _onSubmit(BuildContext context) {
    address.detail = _detailController.text;
    address.phone = _telController.text;
    address.name = _unameController.text;

    closeKeyboard(context);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: CircularProgressIndicator(),
          );
        });

    Global.user.reqUpdateAddress(address, success: () {
      Navigator.pop(context);
      Navigator.pop(context, true);
    }, fail: () {
      Navigator.pop(context);
    //  XToast.success("更新地址failed");
    });
  }
}
