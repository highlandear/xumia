import 'dart:convert';

class NFTData {
  NFTData({
    this.id = '',
    this.path = '',
    this.desc = '',
    this.owner = '',
    this.condition = ''
  });

  String id;
  String path;
  String desc;
  String owner;
  String condition;

  static NFTData fromJson(Map<String, dynamic> json) {
    return NFTData(
      id:json['id'],
      path: json['path'],
      desc: json['desc'],
      condition: json['condition'],
      owner: json['owner']
    );
  }

  static List<NFTData> listfromJson(dynamic json) {
    return (jsonDecode(json)['data'] as List<dynamic>)
          .map((e) => NFTData.fromJson((e as Map<String, dynamic>)))
          .toList();
  }
}
