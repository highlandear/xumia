import 'dart:convert';

class GNFTData {
  GNFTData({this.data = '', this.caption = '', this.author = ''});

  String caption;
  String author;
  String data;
  static GNFTData fromJson(Map<String, dynamic> json) {
    return GNFTData(
        data: json['data'],
        caption: json['caption'],
        author: json['author']
    );
  }

  static List<GNFTData> listfromJson(dynamic json) {
    // print(json);
    return (jsonDecode(json)['data'] as List<dynamic>)
        .map((e) => GNFTData.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
