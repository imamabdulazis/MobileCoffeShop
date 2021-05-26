import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/update_cart_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'update_cart_event.dart';
part 'update_cart_state.dart';

class UpdateCartBloc extends Bloc<UpdateCartEvent, UpdateCartState> {
  final ApiProvider apiProvider = ApiProvider();
  UpdateCartBloc() : super(UpdateCartInitial());

  @override
  Stream<UpdateCartState> mapEventToState(
    UpdateCartEvent event,
  ) async* {
    if (event is OnUpdateCartEvent) {
      yield UpdateCartLoading();

      DefaultModel model = await apiProvider.updateCart(event.body);
      if (model.error != null) {
        yield UpdateCartFailure(model.error);
        return;
      } else {
        yield UpdateCartSuccess();
        return;
      }
    }
  }
}
