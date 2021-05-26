part of 'update_cart_bloc.dart';

@immutable
abstract class UpdateCartState {}

class UpdateCartInitial extends UpdateCartState {}

class UpdateCartLoading extends UpdateCartState {}

class UpdateCartFailure extends UpdateCartState {
  final String message;

  UpdateCartFailure(this.message);
}

class UpdateCartSuccess extends UpdateCartState {}
