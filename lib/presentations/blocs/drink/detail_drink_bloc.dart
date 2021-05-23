import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class DetailDrinkBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<DetailDrinkModel>();

  getDrink(String id) async {
    _subject.value = null;
    DetailDrinkModel drink = await provider.getDetailDrink(id);
    _subject.sink.add(drink);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DetailDrinkModel> get subject => _subject;
}

final detailDrinkBloc = DetailDrinkBloc();
