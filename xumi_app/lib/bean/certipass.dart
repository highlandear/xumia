import 'dart:convert';

class CertiPass {
  CertiPass(
      {this.id = '',
      this.type = '',
      this.cover = '',
      this.desc = '',
      this.owner = '',
      this.condition = ''});

  String id;
  String type;
  String cover;
  String desc;
  String owner;
  String condition;

  static CertiPass fromJson(Map<String, dynamic> json) {
    return CertiPass(
        id: json['id'],
        type: json['type'],
        cover: json['cover'],
        desc: json['desc'],
        condition: json['condition'],
        owner: json['owner']);
  }

  static List<CertiPass> listfromJson(dynamic json) {
    return (jsonDecode(json)['data'] as List<dynamic>)
        .map((e) => CertiPass.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
