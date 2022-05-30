 import '../bean/nftdata.dart';
import '../bean/user_info.dart';

class Global{
   static Global _instance = Global();

   static Global get mydata => _instance;

   List<NFTData> nlist = [];
   UserInfo me = UserInfo(nick: 'Andy 黄',
       did: '0X75C2839BE207343373',
       tel: '132222222222',
       addr: '北京',
       image: 'assets/images/head.jpg'
   );
 }