import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class DrinkBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<DrinkModel>();

  getDrink(String id) async {
    _subject.value = null;
    DrinkModel drink = await provider.getDrink(id);
    _subject.sink.add(drink);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DrinkModel> get subject => _subject;
}

final drinkBloc = DrinkBloc();
