import 'dart:convert';
class MagData {
  MagData({
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

  static MagData fromJson(Map<String, dynamic> json) {
    return MagData(
      id:json['id'],
      path: json['path'],
      desc: json['desc'],
      condition: json['condition'],
      owner: json['owner']
    );
  }

  static List<MagData> listfromJson(dynamic json) {
    print(json);
    return (jsonDecode(json)['data'] as List<dynamic>)
          .map((e) => MagData.fromJson((e as Map<String, dynamic>)))
          .toList();
  }
}
