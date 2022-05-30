class UserInfo{
  UserInfo({
    this.nick='',
    this.did='',
    this.tel='',
    this.addr='',
    this.image=''
});
  String nick;
  String did;
  String tel;
  String addr;
  String image;

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      nick: json['nick'],
      did : json['did'],
    );
  }
}