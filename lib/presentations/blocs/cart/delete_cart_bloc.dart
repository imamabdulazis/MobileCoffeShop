import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'delete_cart_event.dart';
part 'delete_cart_state.dart';

class DeleteCartBloc extends Bloc<DeleteCartEvent, DeleteCartState> {
  final ApiProvider apiProvider = ApiProvider();
  DeleteCartBloc() : super(DeleteCartInitial());

  @override
  Stream<DeleteCartState> mapEventToState(
    DeleteCartEvent event,
  ) async* {
    if (event is OnDeleteCartEvent) {
      yield DeleteCartLoading();

      DefaultModel model = await apiProvider.deleteCart(event.id);
      if (model.error != null) {
        yield DeleteCartFailure(model.error);
        return;
      } else {
        yield DeleteCartSuccess();
        return;
      }
    }
  }
}
