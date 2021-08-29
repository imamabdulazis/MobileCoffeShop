part of 'order_kasir_bloc.dart';

@immutable
abstract class OrderKasirEvent {}

class OnOrderKasirEvent extends OrderKasirEvent {
  final OrderKasirBody body;

  OnOrderKasirEvent(this.body);
}
