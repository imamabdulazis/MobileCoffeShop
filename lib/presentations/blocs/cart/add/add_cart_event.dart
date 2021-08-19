part of 'add_cart_bloc.dart';

@immutable
abstract class AddCartEvent {}

class OnAddCartEvent extends AddCartEvent {
  final AddCartBody body;

  OnAddCartEvent(this.body);
}
