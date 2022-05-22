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
      //path: 'assets/images/a.png',
      path:'https://c-ssl.duitang.com/uploads/item/201912/19/20191219161051_zxnyw.jpg',
      desc: '边顶藏香-喜马拉雅香之000专用隔热香盘',
      owner: 'Tom',
    ),
    NFTData(
     // path: 'assets/images/b.png',
      path:'https://c-ssl.duitang.com/uploads/item/201510/31/20151031151335_xRwzJ.gif',

      desc: '边顶BOUNDLESS常规款',
      owner: 'Jean',

    ),
    NFTData(
     // path: 'assets/images/g1.gif',
      path:'https://c-ssl.duitang.com/uploads/item/201808/15/20180815140434_yhsmp.jpg',

      desc: 'Boundless 天高云淡系列',
      owner: '黄小迪',

    ),
    NFTData(
    //  path: 'assets/hotel/b-2.jpg',
      path:'https://img.alicdn.com/imgextra/i3/516487010/O1CN01P959Rr21ecuBeiMrd_!!516487010.jpg',

      desc: '四合一',
      owner: 'Guanbin',

    ),

  ];
}
