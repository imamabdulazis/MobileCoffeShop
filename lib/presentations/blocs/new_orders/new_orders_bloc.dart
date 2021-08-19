import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/new_order_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/models/response/order_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'new_orders_event.dart';
part 'new_orders_state.dart';

class NewOrdersBloc extends Bloc<NewOrdersEvent, NewOrdersState> {
  final ApiProvider apiProvider = ApiProvider();
  NewOrdersBloc() : super(NewOrdersInitial());

  @override
  Stream<NewOrdersState> mapEventToState(
    NewOrdersEvent event,
  ) async* {
    if (event is OnNewOrdersEvent) {
      yield NewOrdersLoading();
      print(event.body);
      OrderModel model = await apiProvider.postNewOrderDrink(event.body);
      print("ERRRO :${model.message}");

      if (model.error != null) {
        yield NewOrdersFailure(model.error);
        return;
      } else {
        yield NewOrdersSuccess(model);
        return;
      }
    }
  }
}
