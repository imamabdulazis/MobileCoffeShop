part of 'delete_favorite_bloc.dart';

@immutable
abstract class DeleteFavoriteEvent {}

class OnDeleteFavoriteEvent extends DeleteFavoriteEvent {
  final String id;

  OnDeleteFavoriteEvent(this.id);
}
