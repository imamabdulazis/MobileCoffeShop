import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/data/models/request/add_cart_body.dart';
import 'package:caffeshop/data/models/request/cart_body.dart';
import 'package:caffeshop/data/models/request/device_body.dart';
import 'package:caffeshop/data/models/request/favorite_body.dart';
import 'package:caffeshop/data/models/request/gopay_body.dart';
import 'package:caffeshop/data/models/request/new_order_body.dart';
import 'package:caffeshop/data/models/request/order_body.dart';
import 'package:caffeshop/data/models/request/order_kasir_body.dart';
import 'package:caffeshop/data/models/request/register_body.dart';
import 'package:caffeshop/data/models/request/update_cart_body.dart';
import 'package:caffeshop/data/models/response/account_model.dart';
import 'package:caffeshop/data/models/response/cart_model.dart';
import 'package:caffeshop/data/models/response/category_model.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:caffeshop/data/models/response/detail_order_model.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/models/response/favorite_model.dart';
import 'package:caffeshop/data/models/response/gopay_model.dart';
import 'package:caffeshop/data/models/response/login_model.dart';
import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/data/models/response/order_list_model.dart';
import 'package:caffeshop/data/models/response/order_model.dart';
import 'package:caffeshop/data/models/response/payment_list_model.dart';
import 'package:caffeshop/data/models/response/payment_model.dart';
import 'package:caffeshop/data/models/response/transaction_status.dart';
import 'package:caffeshop/data/remote/interceptor.dart';
import 'package:caffeshop/data/remote/network_exceptions.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio;

  final prefs = SharedPreferencesManager();

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://copsychus.vercel.app',
      // baseUrl: 'http://10.0.2.2:3000',
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

  Future<DrinkModel> searchDrink(String query) async {
    try {
      final Response response = await dio.post('/api/v1/search',
          data: {"name": query.toString()},
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
          '/api/v1/cart_item/user/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
          options: Options(headers: {'isToken': true}));
      return CartModel.fromJson(response.data);
    } catch (e) {
      return CartModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> postCart(CartBody body) async {
    try {
      final Response response = await dio.post('/api/v1/cart',
          data: body.toJson(), options: Options(headers: {'isToken': true}));
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> updateCart(UpdateCartBody body) async {
    try {
      final Response response = await dio.put(
          '/api/v1/cart/user/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
          data: body.toJson(),
          options: Options(headers: {'isToken': true}));
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> deleteCart(String id) async {
    try {
      final Response response = await dio.delete('/api/v1/cart_item/$id',
          options: Options(headers: {'isToken': true}));
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<FavoriteModel> getFavorite() async {
    try {
      final Response response = await dio.get(
          '/api/v1/favorite/user/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
          options: Options(headers: {'isToken': true}));
      return FavoriteModel.fromJson(response.data);
    } catch (e) {
      return FavoriteModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> postFavorite(FavoriteBody body) async {
    try {
      final Response response = await dio.post('/api/v1/favorite',
          data: body.toJson(), options: Options(headers: {'isToken': true}));
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DefaultModel> deleteFavorite(String id) async {
    try {
      final Response response = await dio.delete(
          '/api/v1/favorite/user/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
          data: {
            "drink_id": id,
          },
          options: Options(headers: {'isToken': true}));
      return DefaultModel.fromJson(response.data);
    } catch (e) {
      return DefaultModel.withError(
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

  Future<OrderModel> postOrder(OrderBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/orders',
        data: body.toJson(),
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

  Future<OrderListModel> getListOrder() async {
    try {
      final Response response = await dio.get(
        '/api/v1/new_orders/user/${prefs.getString(SharedPreferencesManager.keyIdUser)}',
        options: Options(headers: {'isToken': true}),
      );
      return OrderListModel.fromJson(response.data);
    } catch (e) {
      return OrderListModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<PaymentGatewayModel> postPaymentGateway(String id) async {
    try {
      final Response response = await dio.get(
        '/api/v1/orders/$id',
        options: Options(headers: {'isToken': true}),
      );
      return PaymentGatewayModel.fromJson(response.data);
    } catch (e) {
      return PaymentGatewayModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<DefaultModel> postDevice(DeviceBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/device',
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

  Future<PeymentMethodList> getListPayment() async {
    try {
      final Response response = await dio.get(
        '/api/v1/payment_method',
        options: Options(headers: {'isToken': true}),
      );
      return PeymentMethodList.fromJson(response.data);
    } catch (e) {
      return PeymentMethodList.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<GopayModel> gopayPeyment(GopayBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/payment/gopay',
        data: body.toJson(),
        options: Options(headers: {'isToken': true}),
      );
      return GopayModel.fromJson(response.data);
    } catch (e) {
      return GopayModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<TransactionStatusModel> statusPeyment(String id) async {
    try {
      final Response response = await dio.get(
        '/api/v1/payment/gopay/$id',
        options: Options(headers: {'isToken': true}),
      );
      return TransactionStatusModel.fromJson(response.data);
    } catch (e) {
      return TransactionStatusModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<OrderModel> postNewOrderDrink(NewOrderBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/new_orders',
        data: body.toJson(),
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

  Future<DefaultModel> postAddCart(AddCartBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/cart_item',
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

  Future<DetailOrderModel> detailorder(String id) async {
    try {
      final Response response = await dio.get(
        '/api/v1/new_orders/detail/$id',
        options: Options(headers: {'isToken': true}),
      );
      return DetailOrderModel.fromJson(response.data);
    } catch (e) {
      return DetailOrderModel.withError(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<DrinkModel> getAllDrink() async {
    try {
      final Response response = await dio.get('/api/v1/drink',
          options: Options(headers: {'isToken': true}));
      return DrinkModel.fromJson(response.data);
    } catch (e) {
      return DrinkModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }

  Future<DetailOrderModel> orderKasir(OrderKasirBody body) async {
    try {
      final Response response = await dio.post(
        '/api/v1/new_orders/kasir',
        data: body.toJson(),
        options: Options(headers: {'isToken': true}),
      );
      return DetailOrderModel.fromJson(response.data);
    } catch (e) {
      return DetailOrderModel.withError(
        NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
      );
    }
  }
}
