import 'dart:io';

import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/utils/injector.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptors extends InterceptorsWrapper {
  final Dio dio;
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  Logger logger = Logger();

  LoggingInterceptors(this.dio);

  @override
  Future onRequest(RequestOptions options) async {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      print(
          'accessToken: ${_sharedPreferencesManager.getString(SharedPreferencesManager.keyAccessToken)}');
      String accessToken = _sharedPreferencesManager
          .getString(SharedPreferencesManager.keyAccessToken);
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    return options;
  }

  @override
  Future onResponse(Response response) {
    logger.v(
        "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
    logger.i("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    logger.d("Response: ${response.data}");
    logger.i("<-- END HTTP");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioError) async {
    print(
        "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");

    int responseCode = dioError.response.statusCode;
    String oldAccessToken = _sharedPreferencesManager
        .getString(SharedPreferencesManager.keyAccessToken);
    if (oldAccessToken != null &&
        responseCode == 401 &&
        _sharedPreferencesManager != null) {

    } else {
      super.onError(dioError);
    }
  }

  bool shouldRetry(DioError err) {
    return err.type == DioErrorType.DEFAULT &&
        err.error != null &&
        err.error is SocketException;
  }
}
