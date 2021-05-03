import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/utils/injector.dart';
import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/data/models/response/login_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiProvier apiProvider;
  final SharedPreferencesManager prefs = locator<SharedPreferencesManager>();
  LoginBloc(this.apiProvider) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // final String tempToken =
    //     prefs.getString(SharedPreferencesManager.keyAccessToken);
    if (event is OnChangeLogin) {
      yield LoginLoading();

      LoginModel result = await apiProvider.postLogin(event.body);

      if (result.error != null) {
        yield LoginFailure(result.error);
        return;
      }
      prefs.putString(SharedPreferencesManager.keyAccessToken, result.token);
      yield LoginSuccess();
    }
  }
}
