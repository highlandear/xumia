import 'dart:convert';

class CertiPass {
  CertiPass(
      {this.id = '',
      this.cover = '',
      this.detail = '',
      this.desc = '',
      this.owner = '',
      this.condition = '',
      this.price = ''});

  String id;
  String cover;
  String detail;
  String desc;
  String owner;
  String condition;
  String price;

  static CertiPass fromJson(Map<String, dynamic> json) {
    return CertiPass(
        id: json['id'],
        cover: json['cover'],
        detail: json['detail'],
        desc: json['desc'],
        condition: json['condition'],
        owner: json['owner'],
        price: json['price']);
  }

  static List<CertiPass> listfromJson(dynamic json) {
    return (jsonDecode(json)['data'] as List<dynamic>)
        .map((e) => CertiPass.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
