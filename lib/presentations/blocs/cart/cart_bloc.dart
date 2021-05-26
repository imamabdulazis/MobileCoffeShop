import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/cart_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class AddCartBloc extends Bloc<CartEvent, CartState> {
  final ApiProvider provider = ApiProvider();
  AddCartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is OnCartEvent) {
      yield CartLoading();

      DefaultModel model = await provider.postCart(event.body);
      if (model.error != null) {
        yield CartFailure(model.error);
        return;
      } else {
        yield CartSuccess();
        return;
      }
    }
  }
}
