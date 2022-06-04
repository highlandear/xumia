class UserInfo {
  UserInfo({
    this.username = '',
    this.did = '',
    this.tel = '',
    //  this.addr = '',
    //  this.image = ''
  });
  String username;
  String did;
  String tel;
  //String addr;
  // String image;

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['did'] = this.did;
    //data['tel'] = this.tel;
    data['username'] = this.username;

    return data;
  }

  static UserInfo fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return UserInfo();
    }
    return UserInfo(
      did: json['did'],
     // tel: json['tel'],
      username: json['username'],
    );
  }

  online(){return ! did.isEmpty;}

}
