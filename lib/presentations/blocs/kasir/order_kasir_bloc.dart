import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/order_kasir_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/models/response/detail_order_model.dart';
import 'package:caffeshop/data/models/response/order_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'order_kasir_event.dart';
part 'order_kasir_state.dart';

class OrderKasirBloc extends Bloc<OrderKasirEvent, OrderKasirState> {
  final ApiProvider apiProvider = ApiProvider();
  OrderKasirBloc() : super(OrderKasirInitial());

  @override
  Stream<OrderKasirState> mapEventToState(
    OrderKasirEvent event,
  ) async* {
    if (event is OnOrderKasirEvent) {
      yield OrderKasirLoading();

      DetailOrderModel result = await apiProvider.orderKasir(event.body);

      print("ERRRO :${result.message}");

      if (result.error != null) {
        yield OrderKasirFailure(result.error);
        return;
      } else {
        DetailOrderModel detail = await apiProvider.detailorder(result.data.id);
        if (detail.error != null) {
          yield OrderKasirFailure(result.error);
          return;
        } else {
          yield OrderKasirSuccess(detail);
          return;
        }
      }
    }
  }
}
