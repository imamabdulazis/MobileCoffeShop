import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/add_cart_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:caffeshop/presentations/blocs/new_orders/new_orders_bloc.dart';
import 'package:meta/meta.dart';

part 'add_cart_event.dart';
part 'add_cart_state.dart';

class AddCartBloc extends Bloc<AddCartEvent, AddCartState> {
  final ApiProvider apiProvider = ApiProvider();
  AddCartBloc() : super(AddCartInitial());

  @override
  Stream<AddCartState> mapEventToState(
    AddCartEvent event,
  ) async* {
    if (event is OnAddCartEvent) {
      yield AddCartLoading();

      DefaultModel model = await apiProvider.postAddCart(event.body);

      print("ERROR_CART :${model.message}");
      if (model.error != null) {
        yield AddCartFailure(model.error);
        return;
      } else {
        yield AddCartSuccess();
        return;
      }
    }
  }
}
