part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}

class OnOrdersEvent extends OrdersEvent {
  final OrderBody orderBody;

  OnOrdersEvent(this.orderBody);
}
