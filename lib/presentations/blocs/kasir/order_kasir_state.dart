part of 'order_kasir_bloc.dart';

@immutable
abstract class OrderKasirState {}

class OrderKasirInitial extends OrderKasirState {}

class OrderKasirLoading extends OrderKasirState {}

class OrderKasirSuccess extends OrderKasirState {
  final DetailOrderModel response;

  OrderKasirSuccess(this.response);
}

class OrderKasirFailure extends OrderKasirState {
  final String message;

  OrderKasirFailure(this.message);
}
