import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/gopay_body.dart';
import 'package:caffeshop/data/models/response/gopay_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'gopay_payment_event.dart';
part 'gopay_payment_state.dart';

class GopayPaymentBloc extends Bloc<GopayPaymentEvent, GopayPaymentState> {
  final ApiProvider apiProvider = ApiProvider();
  GopayPaymentBloc() : super(GopayPaymentInitial());

  @override
  Stream<GopayPaymentState> mapEventToState(
    GopayPaymentEvent event,
  ) async* {
    if (event is OnGopayPaymentEvent) {
      yield GopayPaymentLoading();

      GopayModel model = await apiProvider.gopayPeyment(event.gopayBody);

      if (model.error != null) {
        yield GopayPaymentFailure(model.error);
        return;
      } else {
        yield GopayPaymentSuccess(model);
        return;
      }
    }
  }
}
