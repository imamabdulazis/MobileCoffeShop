import 'package:caffeshop/data/models/response/account_model.dart';
import 'package:caffeshop/data/models/response/cart_model.dart';
import 'package:caffeshop/data/models/response/category_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class CartBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<CartModel>();

  getCart() async {
    _subject.value = null;
    CartModel cartModel = await provider.getCart();
    _subject.sink.add(cartModel);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CartModel> get subject => _subject;
}

final cartBloc = CartBloc();
