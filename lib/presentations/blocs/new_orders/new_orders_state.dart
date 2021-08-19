part of 'new_orders_bloc.dart';

@immutable
abstract class NewOrdersState {}

class NewOrdersInitial extends NewOrdersState {}

class NewOrdersLoading extends NewOrdersState {}

class NewOrdersSuccess extends NewOrdersState {
  final OrderModel response;

  NewOrdersSuccess(this.response);
}

class NewOrdersFailure extends NewOrdersState {
  final String message;

  NewOrdersFailure(this.message);
}
