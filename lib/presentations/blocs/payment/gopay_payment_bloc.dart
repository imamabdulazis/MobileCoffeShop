import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gopay_payment_event.dart';
part 'gopay_payment_state.dart';

class GopayPaymentBloc extends Bloc<GopayPaymentEvent, GopayPaymentState> {
  GopayPaymentBloc() : super(GopayPaymentInitial());

  @override
  Stream<GopayPaymentState> mapEventToState(
    GopayPaymentEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
