part of 'delete_favorite_bloc.dart';

@immutable
abstract class DeleteFavoriteState {}

class DeleteFavoriteInitial extends DeleteFavoriteState {}

class DeleteFavoriteLoading extends DeleteFavoriteState {}

class DeleteFavoriteFailure extends DeleteFavoriteState {
  final String message;

  DeleteFavoriteFailure(this.message);
}

class DeleteFavoriteSuccess extends DeleteFavoriteState {}
