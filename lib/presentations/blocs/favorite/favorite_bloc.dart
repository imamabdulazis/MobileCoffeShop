import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/favorite_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ApiProvider provider = ApiProvider();

  FavoriteBloc() : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is OnAddFavorite) {
      yield FavoriteLoading();

      DefaultModel model = await provider.postFavorite(event.body);
      if (model.error != null) {
        yield FavoriteFailure(model.error);
        return;
      } else {
        yield FavoriteSuccess();
        return;
      }
    }
  }
}
