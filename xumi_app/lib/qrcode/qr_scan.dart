import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
class BarcodeScanPage extends StatefulWidget {
  BarcodeScanPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  //现在的时间
  var _currentTime = DateTime.now().hour;
  //控制闪光灯
  bool? flashLigh = true;

  _doBarcodeScan() async {
    //ScanOptions设置闪光灯和前后摄像头
    var options = ScanOptions(
        autoEnableFlash: flashLigh!,
        strings: {'cancel': '取消', 'flash_on': '闪光灯开/关', 'flash_off': '闪光灯开/关'});
    //返回扫描的参数
    var result = await BarcodeScanner.scan(options: options);
    //扫描返回值的类型
    print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    print(result.type);
    //返回参数
    print(result.rawContent);
    //格式
    print(result.format);
  }

  @override
  void initState() {
    super.initState();
  /*
    //如果早上7至晚上19点，闪光灯默认关闭
    if (_currentTime >= 7 && _currentTime <= 19) {
      setState(() {
        flashLigh = false;
      });
    }

   */
  }
  @override
  void dispose() {
    super.dispose();
  //  _doBarcodeScan().cancel();//销毁
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('扫描页面'),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _doBarcodeScan, child: Text('开始扫描')),
            ],
          ),
        ));
  }
}

