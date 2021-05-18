import 'package:caffeshop/data/models/response/category_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class CategoryBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<CategoryModel>();

  getCategory() async {
    _subject.value = null;
    CategoryModel category = await provider.getCategory();
    _subject.sink.add(category);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CategoryModel> get subject => _subject;
}

final categoryBloc = CategoryBloc();
