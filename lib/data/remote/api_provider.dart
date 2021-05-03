import 'package:caffeshop/data/models/response/login_model.dart';
import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/data/remote/interceptor.dart';
import 'package:dio/dio.dart';

class ApiProvier {
  Dio dio;

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
    dio.interceptors.clear();
    dio.interceptors.add(LoggingInterceptors(dio));
  }

  Future<LoginModel> postLogin(LoginBody body) async {
    try {
      final Response response =
          await dio.post('/api/v1/login', data: body.toJson());
      return LoginModel.fromJson(response.data);
    } catch (e) {
      return LoginModel.withError(e);
    }
  }
}
