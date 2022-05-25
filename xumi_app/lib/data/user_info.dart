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

  static UserInfo me = UserInfo(nick: 'Andy 黄',
    did: '0X75C2839BE207343373',
    tel: '132222222222',
    addr: '北京',
    image: 'assets/images/head.jpg'
  );
}