class UserInfo {
  UserInfo({
    this.phoneid = '',
    this.token = '',
  });

  String phoneid;
  String token; // tel

  /*
  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneid'] = phoneid;
    data['token'] = token;

    return data;
  }
  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
    //  phoneid: json['did'],
      token: json['token'],
    );
  }
  */
  bool online() {
    return token.isNotEmpty;
  }
}
