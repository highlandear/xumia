class UserInfo {
  UserInfo({
    this.did = '',
    this.mainID = '',
  });

  String did;
  String mainID; // tel

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['did'] = did;
    data['tel'] = mainID;

    return data;
  }

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      did: json['did'],
      mainID: json['tel'],
    );
  }

  bool online() {
    return did.isNotEmpty;
  }
}
