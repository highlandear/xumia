import 'dart:convert';

class GNFTCard {
  GNFTCard({
    this.path = '',
    this.desc = '',
  });

  String path;
  String desc;

  static GNFTCard fromJson(Map<String, dynamic> json) {
    return GNFTCard(
      path: json['path'],
      desc: json['desc']
    );
  }

  static List<GNFTCard> listfromJson(dynamic json) {
   // print(json);
    return (jsonDecode(json)['data'] as List<dynamic>)
        .map((e) => GNFTCard.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
