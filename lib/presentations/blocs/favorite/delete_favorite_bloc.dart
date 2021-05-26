import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'delete_favorite_event.dart';
part 'delete_favorite_state.dart';

class DeleteFavoriteBloc
    extends Bloc<DeleteFavoriteEvent, DeleteFavoriteState> {
  final ApiProvider apiProvider = ApiProvider();
  DeleteFavoriteBloc() : super(DeleteFavoriteInitial());

  @override
  Stream<DeleteFavoriteState> mapEventToState(
    DeleteFavoriteEvent event,
  ) async* {
    if (event is OnDeleteFavoriteEvent) {
      yield DeleteFavoriteLoading();

      DefaultModel model = await apiProvider.deleteFavorite(event.id);
      if (model.error != null) {
        yield DeleteFavoriteFailure(model.error);
        return;
      } else {
        yield DeleteFavoriteSuccess();
        return;
      }
    }
  }
}
