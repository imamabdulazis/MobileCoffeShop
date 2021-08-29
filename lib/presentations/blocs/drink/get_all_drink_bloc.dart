import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class GetAllDrinkBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<DrinkModel>();

  fetchAllDrink() async {
    _subject.value = null;
    DrinkModel drink = await provider.getAllDrink();
    _subject.sink.add(drink);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DrinkModel> get subject => _subject;
}

final getAllDrinkBloc = GetAllDrinkBloc();
