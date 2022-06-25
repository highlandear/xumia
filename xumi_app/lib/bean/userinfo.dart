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
    data['mainID'] = mainID;

    return data;
  }

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      did: json['did'],
      mainID: json['mainID'],
    );
  }

  bool online() {
    return did.isNotEmpty;
  }
}
