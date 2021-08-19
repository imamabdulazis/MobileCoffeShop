part of 'new_orders_bloc.dart';

@immutable
abstract class NewOrdersEvent {}

class OnNewOrdersEvent extends NewOrdersEvent {
  final NewOrderBody body;

  OnNewOrdersEvent(this.body);
}
