import 'package:dio/dio.dart';
import '../data/config.dart';

class Http {
  static Http _http = Http();

  Dio dio = Dio();
  CancelToken cancelToken = CancelToken();
  BaseOptions options = BaseOptions(
    //请求基地址,可以包含子路径
    baseUrl: Config.BASE_URL,
    //连接服务器超时时间，单位是毫秒.
    connectTimeout: 10000,
    //2.x中为接收数据的最长时限
    receiveTimeout: 5000,
    headers: {"token": ""},
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );


  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

   static get http  {
   // _http.dio.interceptors.add(interceptorsWrapper());
    return _http;
  }

  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
     // print(options.path);
      //print(options.queryParameters);
      //print(options.headers.toString());
      return handler.next(options); //continue
      // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    });
  }

  ///Get请求
  void get(
      String url, {
        parameters,
      //  cancelToken,
        required Function(dynamic t) onSuccess,
        required Function(String error) onError,
      }) async {
    try {
      request(url,
          method: GET,
          //cancelToken: cancelToken,
          parameters: parameters,
          onSuccess: onSuccess,
          onError: onError);
    } catch (e) {
      print(e);
    }
  }

  void post(
      String url, {
        parameters,
        required Function(dynamic t) onSuccess,
        required Function(String error) onError,
      }) async {
    ///定义请求参数
    parameters = parameters ?? Map<String, dynamic>();
     request(url,
        method: POST,
        parameters: parameters,
        onSuccess: onSuccess,
        onError: onError);
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath, onReceiveProgress) async {
    late Response response ;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: onReceiveProgress);
    } on DioError catch (e) {
      formatError(e);
    }
    return response.data;
  }

  /*
   * 上传多个文件,key为files[]
   * v3.0.0 以后通过Formdata.fromMap()创建的Formdata,如果有文件数组，是默认会给key加上“[]”的
   */
  uploadFiles(String url, List<String> list, onSuccess, onError) async {
    var formData = FormData.fromMap({
      'files': list.map((e) {
        return MultipartFile.fromFileSync(e,
            filename: e.substring(e.indexOf("/")));
      })
    });
    request(url,
        method: POST,
        parameters: formData,
        onSuccess: onSuccess,
        onError: onError);
  }

  uploadFiles2(String url, List<String> list, onSuccess, onError) async {
    var formData = FormData();
    list.map((e) {
      formData.files.add(MapEntry(
          'files',
          MultipartFile.fromFileSync(e,
              filename: e.substring(e.indexOf("/")))));
    });
    request(url,
        method: POST,
        parameters: formData,
        onSuccess: onSuccess,
        onError: onError);
  }

  void request(
      String url, {
        required String method,
        parameters,
        required Function(dynamic t) onSuccess,
        required Function(String error) onError,
      }) async {
    try {
      //这里指定response自动转成map,不指定的话有可能是String类型
      Response response;
      switch (method) {
        case GET:
          response = await dio.get(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
              cancelToken: cancelToken);
          break;
        case PUT:
          response = await dio.put(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
              cancelToken: cancelToken);
          break;
        case PATCH:
          response = await dio.patch(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
              cancelToken: cancelToken);
          break;
        case DELETE:
          response = await dio.delete(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
              cancelToken: cancelToken);
          break;
        default:
          response = await dio.post(url,
             // queryParameters: parameters ?? new Map<String, dynamic>(),
            //  data: parameters,
              queryParameters:parameters,
              cancelToken: cancelToken);
          print(parameters);
          break;
      }

      //200代表网络请求成功
      if (response.statusCode == 200) {
        onSuccess(response.data);
      } else {
        throw Exception('${response.statusCode}+${response.statusMessage}');
      }
    } catch (e) {
      print(e.toString());
      onError(e.toString());
    }
  }

  void formatError(DioError e) {
    print(e.message);
  }

  void getHttpJson(T) {


  }
  /*
   * 取消请求
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}

