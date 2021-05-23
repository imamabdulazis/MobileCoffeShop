import 'package:caffeshop/data/models/response/account_model.dart';
import 'package:caffeshop/data/models/response/category_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:rxdart/subjects.dart';

class AccountBloc {
  final ApiProvider provider = ApiProvider();

  // ignore: close_sinks
  final _subject = BehaviorSubject<AccountModel>();

  getAccount(String id) async {
    _subject.value = null;
    AccountModel accountModel = await provider.getAccount(id);
    _subject.sink.add(accountModel);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AccountModel> get subject => _subject;
}

final accountBloc = AccountBloc();
