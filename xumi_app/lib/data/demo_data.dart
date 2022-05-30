class DemoData {
  DemoData({
    this.imagePath = '',
    this.titleTxt = '',
  });

  String imagePath;
  String titleTxt;

  static List<DemoData> nftlist = <DemoData>[
    DemoData(
      imagePath: 'assets/hotel/h_1.png',
      titleTxt: '边顶藏香-喜马拉雅香之000专用隔热香盘',
    ),
    DemoData(
      imagePath: 'assets/hotel/b-3.jpg',
      titleTxt: '边顶BOUNDLESS常规款',
    ),
    DemoData(
      imagePath: 'assets/hotel/b-2.jpg',
      titleTxt: 'Boundless 天高云淡系列',
    ),
    DemoData(
      imagePath: 'assets/hotel/b-2.jpg',
      titleTxt: '四合一',
    ),

  ];

/*
    //String value = await RequestData('http://10.0.0.6:8080/logon.do').request();
    RequestData('http://10.0.0.6:8080/signin.do').request().then((value) => {
      print(value),

      MyData.instance.nlist = (jsonDecode(value) as List<dynamic>)
          .map((e) => NFTData.fromJson((e as Map<String, dynamic>)))
          .toList()
    });
    */

}
