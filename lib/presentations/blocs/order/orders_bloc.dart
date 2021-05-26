import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/order_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/models/response/order_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final ApiProvider apiProvider = ApiProvider();
  OrdersBloc() : super(OrdersInitial());

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if (event is OnOrdersEvent) {
      yield OrdersLoading();
      OrderModel model = await apiProvider.postOrder(event.orderBody);

      if (model.error != null) {
        yield OrdersFailure(model.error);
        return;
      } else {
        yield OrdersSuccess(model);
      }
    }
  }
}
