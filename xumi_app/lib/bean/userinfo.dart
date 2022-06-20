class UserInfo {
  UserInfo({
   this.did = '',
    this.tel = '',
  });

  String did;
  String tel;

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['did'] = did;
    data['tel'] = tel;

    return data;
  }

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      did: json['did'],
     tel: json['tel'],
    );
  }

  bool online(){return  did.isNotEmpty;}
}