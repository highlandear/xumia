class NFTData {
  NFTData({
    this.path = '',
    this.desc = '',
    this.owner = '',
  });

  String path;
  String desc;
  String owner;

  static List<NFTData> nlist = <NFTData>[
    NFTData(
      path: 'assets/hotel/h_1.png',
      desc: '边顶藏香-喜马拉雅香之000专用隔热香盘',
      owner: 'Tom',
    ),
    NFTData(
      path: 'assets/hotel/b-3.jpg',
      desc: '边顶BOUNDLESS常规款',
      owner: 'Jean',

    ),
    NFTData(
      path: 'assets/hotel/b-2.jpg',
      desc: 'Boundless 天高云淡系列',
      owner: '黄小迪',

    ),
    NFTData(
      path: 'assets/hotel/b-2.jpg',
      desc: '四合一',
      owner: 'Guanbin',

    ),

  ];
}
