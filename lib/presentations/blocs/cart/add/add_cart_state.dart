part of 'add_cart_bloc.dart';

@immutable
abstract class AddCartState {}

class AddCartInitial extends AddCartState {}

class AddCartLoading extends AddCartState {}

class AddCartSuccess extends AddCartState {}

class AddCartFailure extends AddCartState {
  final String message;

  AddCartFailure(this.message);
}
