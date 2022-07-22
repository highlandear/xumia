import 'package:dio/dio.dart';
import '../data/config.dart';

class XHttp {
  static final XHttp _http = XHttp();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: Config.baseURL,
    connectTimeout: 5000,
    receiveTimeout: 5000,
    headers: {'Authorization': 'Basic Y2xpZW50Og=='},
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  ));


  static get instance => _http;

  XHttp() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      print("请求之前");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      print("响应之前");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print("错误之前");
      _handleError(e);
      return handler.next(e);
    }));
  }

  setHeaders(key, value){
    _dio.options.headers[key] = value;
  }

  _handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        print("连接超时");
        break;
      case DioErrorType.sendTimeout:
        print("请求超时");
        break;
      case DioErrorType.receiveTimeout:
        print("响应超时");
        break;
      case DioErrorType.response:
        print("出现异常");
        break;
      case DioErrorType.cancel:
        print("请求取消");
        break;
      default:
        print("未知错误");
        break;
    }
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = 100;

    return data;
  }

  _onResponse(Response response) {
    if (response.statusCode == 200) {
   //   print(response.data);
      return response.data;
    }

    return null;
  }

  get(String url, {params}) async {
    Response response;
    try {
      if (params != null) {
        response = await _dio.get(url, queryParameters: params);
      } else {
        response = await _dio.get(url);
      }
      return _onResponse(response);
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  post(String url, {params}) async {
    try {
      Response response = await _dio.post(url, queryParameters: params);
      return _onResponse(response);
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  Future postJson(String url, {data}) async {
    try {
      Response response = await _dio.post(url, data: data);
      return _onResponse(response);
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  Future postData(String url, {params, data}) async {
    try {
      Response response =
          await _dio.post(url, queryParameters: params, data: data);
      return _onResponse(response);
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  Future downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        print("$count $total");
      });
      return response.data;
    } on DioError catch (e) {
      return _handleError(e);
    }
  }
}
