import 'package:flutter/cupertino.dart';

class UserInfo {
  UserInfo({
    this.phoneID = '',    // 手机号
    this.token = '',
  });

  String phoneID;
  String token;

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneID'] = phoneID;
    data['token'] = token;

    return data;
  }
  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
        phoneID: json['phoneID'],
        token: json['token'],
    );
  }
}
