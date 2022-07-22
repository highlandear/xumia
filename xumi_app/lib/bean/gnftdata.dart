import '../data/config.dart';

class GNFTData {
  GNFTData({
    this.id = 0,
    this.type = 0,
    this.desc = '',
    this.nftpath = '',
    this.url = '',
    this.extra = ''
  });

  int id;
  int type;
  String desc;
  String nftpath;
  String url;
  String extra;

  static String getHttpFromIpfs(String ipfs){
    return ipfs.replaceFirst('ipfs://', Config.rootUrl);
  }

  static GNFTData fromJson(Map<String, dynamic> json) {
    return GNFTData(
        id: json['id'],
        type: json['type'],
        desc: json['desc'],
        url: json['url'],
        nftpath: getHttpFromIpfs(json['ipfsHash']),
        extra : json['extra']
    );
  }

  static List<GNFTData> listfromJson(dynamic json) {
    return (json['data'] as List<dynamic>)
        .map((e) => GNFTData.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
