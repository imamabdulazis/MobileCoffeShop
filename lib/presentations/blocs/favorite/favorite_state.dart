part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String message;

  FavoriteFailure(this.message);
}
