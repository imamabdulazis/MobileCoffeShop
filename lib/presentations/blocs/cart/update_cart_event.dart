part of 'update_cart_bloc.dart';

@immutable
abstract class UpdateCartEvent {}

class OnUpdateCartEvent extends UpdateCartEvent {
  final UpdateCartBody body;

  OnUpdateCartEvent(this.body);
}
