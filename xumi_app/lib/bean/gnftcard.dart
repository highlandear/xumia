import 'dart:convert';

class NftArt {
  NftArt({
    this.path = '',
    this.data = '',
  });

  String path;
  String data;
  static NftArt fromJson(Map<String, dynamic> json) {
    return NftArt(
      path: json['path'],
     // desc: json['desc']
    );
  }

  static List<NftArt> listfromJson(dynamic json) {
   // print(json);
    return (jsonDecode(json)['data'] as List<dynamic>)
        .map((e) => NftArt.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
