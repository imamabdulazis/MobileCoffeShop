import 'package:caffeshop/data/models/response/favorite_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class FavoriteBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<FavoriteModel>();

  getAccount() async {
    _subject.value = null;
    FavoriteModel favoriteModel = await provider.getFavorite();
    _subject.sink.add(favoriteModel);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<FavoriteModel> get subject => _subject;
}

final favoriteBloc = FavoriteBloc();
