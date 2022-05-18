class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.price = 180,
    this.unit = '',
  });

  String imagePath;
  String titleTxt;
  double dist;
  double rating;
  int reviews;
  int price;
  String unit;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/h_1.png',
      titleTxt: '边顶藏香-喜马拉雅香之000专用隔热香盘',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      price: 180,
      unit: '盒',
    ),
    HotelListData(
      imagePath: 'assets/hotel/b-3.jpg',
      titleTxt: '边顶BOUNDLESS常规款',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      price: 200,
      unit: '包',
    ),
    HotelListData(
      imagePath: 'assets/hotel/b-2.jpg',
      titleTxt: 'Boundless 天高云淡系列',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      price: 60,
      unit: '盒',
    ),
    HotelListData(
      imagePath: 'assets/hotel/b-2.jpg',
      titleTxt: '四合一',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      price: 170,
      unit: '盒',
    ),

  ];
}
