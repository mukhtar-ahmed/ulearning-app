import 'package:dio/dio.dart';
import 'package:ulearning_app/pages/global.dart';

class HttpUtils {
  late Dio dio;
  static final HttpUtils _instance = HttpUtils._internal();
  factory HttpUtils() {
    return _instance;
  }
  HttpUtils._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: 'http://127.0.0.1:8000',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: 'application/json',
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var header = <String, dynamic>{};
    String accessToken = Global.storageService.getUserAcessToken();
    if (accessToken.isNotEmpty && accessToken != '') {
      header['Authorization'] = 'Bearer $accessToken';
    }
    return header;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    return response.data;
  }
}
