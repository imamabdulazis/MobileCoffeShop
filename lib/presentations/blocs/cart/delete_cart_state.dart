part of 'delete_cart_bloc.dart';

@immutable
abstract class DeleteCartState {}

class DeleteCartInitial extends DeleteCartState {}

class DeleteCartLoading extends DeleteCartState {}

class DeleteCartFailure extends DeleteCartState {
  final String message;

  DeleteCartFailure(this.message);
}

class DeleteCartSuccess extends DeleteCartState {}
