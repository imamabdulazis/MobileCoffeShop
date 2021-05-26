part of 'delete_cart_bloc.dart';

@immutable
abstract class DeleteCartEvent {}

class OnDeleteCartEvent extends DeleteCartEvent {
  final String id;

  OnDeleteCartEvent(this.id);
}
