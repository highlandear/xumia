import 'package:dio/dio.dart';
import '../data/config.dart';

class XHttp {
  static final XHttp _http = XHttp();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: Config.BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 5000,
    headers: {"token": ""},
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

  void _handleError(DioError e) {
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
  }

  _onResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    }
  //  print(response.statusCode);
  //  print('err === ${response.statusCode}+${response.statusMessage}');
    return null;
  }
  get(String url, {params}) async {
    Response response;
    if (params != null) {
      response = await _dio.get(url, queryParameters: params);
    } else {
      response = await _dio.get(url);
    }

    return _onResponse(response);
  }

  post(String url, {params}) async {
    Response response = await _dio.post(url, queryParameters: params);
    return _onResponse(response);
  }

  Future postJson(String url, data) async {
    Response response = await _dio.post(url, data: data);
    return _onResponse(response);
  }

  Future downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
    } on DioError catch (e) {
      _handleError(e);
      return null;
    }
    return response.data;
  }
}
