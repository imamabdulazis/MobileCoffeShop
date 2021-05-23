import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/data/models/request/order_body.dart';
import 'package:caffeshop/data/models/request/register_body.dart';
import 'package:caffeshop/data/models/response/account_model.dart';
import 'package:caffeshop/data/models/response/cart_model.dart';
import 'package:caffeshop/data/models/response/category_model.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/models/response/favorite_model.dart';
import 'package:caffeshop/data/models/response/login_model.dart';
import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/data/models/response/order_model.dart';
import 'package:caffeshop/data/remote/interceptor.dart';
import 'package:caffeshop/data/remote/network_exceptions.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio;

  final prefs = SharedPreferencesManager();

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.100.7:3000',
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

  Future<DetailDrinkModel> getDetailDrink(String id) async {
    try {
      final Response response = await dio.get('/api/v1/drink//$id',
          options: Options(headers: {'isToken': true}));
      return DetailDrinkModel.fromJson(response.data);
    } catch (e) {
      return DetailDrinkModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<CartModel> getCart() async {
    try {
      final Response response = await dio.get(
          '/api/v1/cart/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
          options: Options(headers: {'isToken': true}));
      return CartModel.fromJson(response.data);
    } catch (e) {
      return CartModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<FavoriteModel> getFavorite() async {
    try {
      final Response response = await dio.get(
          '/api/v1/favorite/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
          options: Options(headers: {'isToken': true}));
      return FavoriteModel.fromJson(response.data);
    } catch (e) {
      return FavoriteModel.withError(
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

  Future<AccountModel> getAccount(String id) async {
    try {
      final Response response = await dio.get('/api/v1/users/$id',
          options: Options(headers: {'isToken': true}));
      return AccountModel.fromJson(response.data);
    } catch (e) {
      return AccountModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> postOrder(OrderBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/orders',
        data: body.toJson(),
        options: Options(headers: {'isToken': true}),
      );
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<OrderModel> getDetailOrder(String id) async {
    try {
      final Response response = await dio.get(
        '/api/v1/orders/$id',
        options: Options(headers: {'isToken': true}),
      );
      return OrderModel.fromJson(response.data);
    } catch (e) {
      return OrderModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
