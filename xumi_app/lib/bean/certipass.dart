import 'dart:convert';

class CertiPass {
  CertiPass(
      {this.id = 0,
      this.cover = '',
      this.desc = '',
      this.detail = '',
      this.freight = false,
      this.price = '￥50'});

  int id;
  String cover; // imageUrl
  String desc;
  String detail;
  bool freight;
  String price;

  hasProduct() => freight;

  static CertiPass fromJson(Map<String, dynamic> json) {
    print(json['id']);
    print(json['imageUrl']);

    return CertiPass(
        id: json['id'],
        cover: json['imageUrl'],
        desc: json['desc'],
        freight: json['freight'],
        detail: json['imageUrl'],
      //  price: json['price']
    );
  }

  static List<CertiPass> listfromJson(dynamic json) {
    // print('-------------------------');
    print(json['data']['list']);
    return (json['data']['list'] as List<dynamic>)
        .map((e) => CertiPass.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
