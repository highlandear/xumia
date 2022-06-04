import 'package:dio/dio.dart';

class RequestData {
  RequestData(this.url);
  String url;

  request() async {
    try {
      Response response = await Dio().get(
        this.url,
        options: Options(responseType: ResponseType.json,receiveTimeout: 3000,sendTimeout: 3000),
      );
      if (response.statusCode == 200) {
        //response.data
        // print("响应数据:${response.data}");
        return response.data;
      } else {
        return '{err=-1}';
      }
    } catch (e) {
      return '{err = -2}';
    }
  }
}
