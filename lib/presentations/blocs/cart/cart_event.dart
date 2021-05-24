part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class OnCartEvent extends CartEvent {
  final CartBody body;

  OnCartEvent(this.body);
}
