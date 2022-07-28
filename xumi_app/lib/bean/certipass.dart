import 'package:xumi_app/bean/question.dart';

class CertiPass {
  CertiPass({
    this.id = 0,
    this.cover = '',
    this.desc = '',
    this.detail = '',
    this.freight = false,
    this.price = '',
    this.qalist = const [],
  });

  int id;
  String cover; // imageUrl
  String desc;
  String detail;
  bool freight;
  String price;
  var qalist = [];

  hasProduct() => freight;

  hasQuiz() => qalist.isNotEmpty;

  static CertiPass fromJson(Map<String, dynamic> json) {
 //   print(json.toString());
    return CertiPass(
      id: json['id'],
      cover: json['imageUrl'],
      desc: json['desc'],
      freight: json['freight'],
      qalist: json['qaList'],
      price: json['price'] ?? '',
      detail: json['descUrl'],
    );
  }

  static List<CertiPass> listfromJson(dynamic json) {
 //   print(json);
    return (json['data']['list'] as List<dynamic>)
        .map((e) => CertiPass.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
