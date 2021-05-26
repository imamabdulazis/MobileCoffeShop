import 'package:caffeshop/data/models/response/payment_list_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class GetPaymentBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<PeymentMethodList>();

  getPayment() async {
    _subject.value = null;
    PeymentMethodList cartModel = await provider.getListPayment();
    _subject.sink.add(cartModel);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PeymentMethodList> get subject => _subject;
}

final getPaymentBloc = GetPaymentBloc();
