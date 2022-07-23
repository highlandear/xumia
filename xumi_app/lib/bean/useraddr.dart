class AddressInfo {
  AddressInfo({
    this.id,
    this.desc = '居住地址',
    this.phone = '',
    this.name = '',
    this.account = '',
    this.prov = '',
    this.city = '',
    this.dist = '',
    this.detail = '',
    this.isDefault = false,
    this.ismain = false,

  });

  var id;
  String desc;
  String phone;
  String name;
  String account;
  String prov;
  String city;
  String dist;
  String detail;
  bool isDefault;
  bool ismain;

  hasAddress() {
    return phone.isNotEmpty;
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['desc'] = desc;
    data['phone'] = phone;
    data['name'] = name;
    data['account'] = account;
    data['province'] = prov;
    data['city'] = city;
    data['district'] = dist;
    data['detailedAddress'] = detail;
    data['default'] = isDefault;
    return data;
  }

  static AddressInfo fromJson(Map<String, dynamic> json) {
    return AddressInfo(
        id: json['id'],
        desc: json['desc'],
        phone: json['phone'],
        name: json['name'],
        account: json['account'],
        prov: json['province'],
        city: json['city'],
        dist: json['district'],
        detail: json['detailedAddress'],
        isDefault: json['default']);
  }

  static List<AddressInfo> listfromJson(dynamic json) {
    return (json as List<dynamic>)
        .map((e) => AddressInfo.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}