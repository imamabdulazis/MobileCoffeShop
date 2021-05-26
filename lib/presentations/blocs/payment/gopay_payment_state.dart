part of 'gopay_payment_bloc.dart';

@immutable
abstract class GopayPaymentState {}

class GopayPaymentInitial extends GopayPaymentState {}

class GopayPaymentLoading extends GopayPaymentState {}

class GopayPaymentFailure extends GopayPaymentState {
  final String message;

  GopayPaymentFailure(this.message);
}

class GopayPaymentSuccess extends GopayPaymentState {
  final String url;

  GopayPaymentSuccess(this.url);
}
