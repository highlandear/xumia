import 'package:dio/dio.dart';
import '../data/config.dart';

class AHttp {
  static AHttp _http = AHttp();
  static get instance  =>  _http;

   Dio dio = Dio(BaseOptions(
    //请求基地址,可以包含子路径
    baseUrl: Config.BASE_URL,
    //连接服务器超时时间，单位是毫秒.
    connectTimeout: 10000,
    //2.x中为接收数据的最长时限
    receiveTimeout: 5000,
    headers: {"token": ""},
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  ));
  //CancelToken cancelToken = CancelToken();

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';
  getm(String url, params) async {
    print('hehhre');
      Response response = await dio.get(url,queryParameters: params ?? new Map<String, dynamic>());
      return response.data;
  }

  get(
      String url, {
        params,
      }) async {
    print('getget');
      return request(url, method: GET, parameters: params);
  }

  post(
      String url, {
        parameters,
      }) async{
    ///定义请求参数
    parameters = parameters ?? Map<String, dynamic>();
    return request(url, method: POST, parameters: parameters);
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
        parameters: formData);
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
        parameters: formData);
  }

  Future request(
      String url, {
        required String method,
        parameters,
      }) async {
    try {
      //这里指定response自动转成map,不指定的话有可能是String类型
      Response response;
      switch (method) {
        case GET:
          response = await dio.get(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
           //   cancelToken: cancelToken
          );
          break;
        case PUT:
          response = await dio.put(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
             // cancelToken: cancelToken
          );
          break;
        case PATCH:
          response = await dio.patch(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
          //    cancelToken: cancelToken
          );
          break;
        case DELETE:
          response = await dio.delete(url,
              queryParameters: parameters ?? new Map<String, dynamic>(),
           //   cancelToken: cancelToken
          );
          break;
        default:
          response = await dio.post(url,
              // queryParameters: parameters ?? new Map<String, dynamic>(),
              //  data: parameters,
              queryParameters:parameters,
          //    cancelToken: cancelToken
          );
          print(parameters);
          break;
      }

      //200代表网络请求成功
      if (response.statusCode == 200) {
        return response.data;
      } else {
        //throw Exception('${response.statusCode}+${response.statusMessage}');
        return null;
      }
    } catch (e) {
      return null;
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

