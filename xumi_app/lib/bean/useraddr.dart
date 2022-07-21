class UserAddress {
  UserAddress({
    this.id,
    this.desc = '居住地址',
    this.phone = '',
    this.name = '',
    this.prov = '',
    this.city = '',
    this.dist = '',
    this.detail = '',
    this.isDefault = false,
  });

  var id;
  String desc;
  String phone;
  String name;
  String prov;
  String city;
  String dist;
  String detail;
  bool isDefault;

  hasAddress() {
    return phone.isNotEmpty;
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['desc'] = desc;
    data['phone'] = phone;
    data['name'] = name;
    data['province'] = prov;
    data['city'] = city;
    data['district'] = dist;
    data['detailedAddress'] = detail;
    data['isDefault'] = isDefault;
    return data;
  }

  static UserAddress fromJson(Map<String, dynamic> json) {
  //  print(json);
    return UserAddress(
        id : json['id'],
        desc:json['desc'],
        phone: json['phone'],
        name: json['name'],
        prov: json['province'],
        city: json['city'],
        dist: json['district'],
        detail: json['detailedAddress'],
        isDefault: json['isDefault']);
  }

  static List<UserAddress> listfromJson(dynamic json) {
    print(json);
    return (json['data'] as List<dynamic>)
        .map((e) => UserAddress.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
