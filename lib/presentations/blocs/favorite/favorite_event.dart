part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class OnAddFavorite extends FavoriteEvent {
  final FavoriteBody body;

  OnAddFavorite(this.body);
}
