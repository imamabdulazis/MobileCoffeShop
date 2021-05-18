import 'package:caffeshop/data/models/request/register_body.dart';
import 'package:caffeshop/data/models/response/category_model.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/models/response/login_model.dart';
import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/data/remote/interceptor.dart';
import 'package:caffeshop/data/remote/network_exceptions.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio;

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.10.19:3000',
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
      print("LOGIN ERROR :$e");
      return LoginModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> postRegister(RegisterBody body) async {
    try {
      final Response response =
          await dio.post('/api/v1/register', data: body.toJson());
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DrinkModel> getDrink(String id) async {
    try {
      final Response response = await dio.get('/api/v1/drink/category/$id',
          options: Options(headers: {'isToken': true}));
      return DrinkModel.fromJson(response.data);
    } catch (e) {
      return DrinkModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<CategoryModel> getCategory() async {
    try {
      final Response response = await dio.get('/api/v1/category',
          options: Options(headers: {'isToken': true}));
      return CategoryModel.fromJson(response.data);
    } catch (e) {
      return CategoryModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }
}
