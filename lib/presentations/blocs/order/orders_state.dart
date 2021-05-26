part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersFailure extends OrdersState {
  final String message;

  OrdersFailure(this.message);
}

class OrdersSuccess extends OrdersState {
  final OrderModel orderModel;

  OrdersSuccess(this.orderModel);
}
