import 'package:caffeshop/data/models/response/order_list_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class OrderHistoryBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<OrderListModel>();

  getOrderList() async {
    _subject.value = null;
    OrderListModel favoriteModel = await provider.getListOrder();
    _subject.sink.add(favoriteModel);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<OrderListModel> get subject => _subject;
}

final orderHistoryBloc = OrderHistoryBloc();
