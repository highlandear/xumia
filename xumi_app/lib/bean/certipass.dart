class CertiPass {
  CertiPass({
    this.id = 0,
    this.cover = '',
    this.desc = '',
    this.detail = '',
    this.freight = false,
    this.price = '￥50',
    this.qlist = '',
  });

  int id;
  String cover; // imageUrl
  String desc;
  String detail;
  bool freight;
  String price;
  String qlist;

  hasProduct() => freight;

  static CertiPass fromJson(Map<String, dynamic> json) {
    return CertiPass(
      id: json['id'],
      cover: json['imageUrl'],
      desc: json['desc'],
      freight: json['freight'],

      qlist: json['qaList'] ?? '',
      //  price: json['price'],
      // detail: json['imageUrl'],
      detail: 'http://cognitivelab.net/static/pb.png',
    );
  }

  static List<CertiPass> listfromJson(dynamic json) {
    return (json['data']['list'] as List<dynamic>)
        .map((e) => CertiPass.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
