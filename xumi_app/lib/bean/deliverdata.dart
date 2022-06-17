class DeliverData {
  DeliverData({
    this.tel = '',
    this.name = '',
    this.address = '',
    this.detail = '',
  });

  String tel;
  String name;
  String address;
  String detail;

  hasAddress() {
    return tel.isNotEmpty;
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tel'] = tel;
    data['name'] = name;
    data['address'] = address;
    data['detail'] = detail;
    return data;
  }

  static DeliverData fromJson(Map<String, dynamic> json) {
    print(json);
    return DeliverData(
        tel: json['tel'],
        name: json['name'],
        address: json['address'],
        detail: json['detail']);
  }
}
