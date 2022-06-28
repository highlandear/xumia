import 'dart:convert';

class GNFTData {
  GNFTData({
    this.id = '',
    this.path = '',
    this.desc = '',
    this.owner = '',
  });

  String id;
  String path;
  String desc;
  String owner;

  static GNFTData fromJson(Map<String, dynamic> json) {
    return GNFTData(
        path: json['path'],
    );
  }

  static List<GNFTData> listfromJson(dynamic json) {
    print(json);
    return (jsonDecode(json)['data'] as List<dynamic>)
        .map((e) => GNFTData.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}