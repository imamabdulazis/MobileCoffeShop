part of 'gopay_payment_bloc.dart';

@immutable
abstract class GopayPaymentEvent {}

class OnGopayPaymentEvent extends GopayPaymentEvent{
  final GopayBody gopayBody;

  OnGopayPaymentEvent(this.gopayBody);
}