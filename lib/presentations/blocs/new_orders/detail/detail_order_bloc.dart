import 'package:caffeshop/data/models/response/detail_order_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class DetailOrderBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<DetailOrderModel>();

  getDetail(String id) async {
    _subject.value = null;
    DetailOrderModel detail = await provider.detailorder(id);
    _subject.sink.add(detail);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DetailOrderModel> get subject => _subject;
}

final detailOrderBloc = DetailOrderBloc();
