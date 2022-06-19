import 'dart:convert';

class NFTData {
  NFTData({
    this.id = '',
    this.path = '',
    this.desc = '',
    this.owner = '',
  });

  String id;
  String path;
  String desc;
  String owner;

  static NFTData fromJson(Map<String, dynamic> json) {
    return NFTData(
      id:json['id'],
      path: json['path'],
      desc: json['desc'],
    );
  }

  static List<NFTData> listfromJson(dynamic json) {
    return (jsonDecode(json)['data'] as List<dynamic>)
          .map((e) => NFTData.fromJson((e as Map<String, dynamic>)))
          .toList();
  }
}
