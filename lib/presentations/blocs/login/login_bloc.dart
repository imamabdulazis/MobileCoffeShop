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
  final ApiProvider apiProvider = ApiProvider();
  final SharedPreferencesManager prefs = locator<SharedPreferencesManager>();
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnChangeLogin) {
      LoginBody loginBody = event.body;
      if (loginBody.username == null || loginBody.username.isEmpty) {
        yield LoginException("Username tidak boleh kosong");
      } else if (loginBody.password == null || loginBody.password.isEmpty) {
        yield LoginException("Password tidak boleh kosong");
      } else {
        yield LoginLoading();
        LoginModel result = await apiProvider.postLogin(event.body);

        if (result.error != null) {
          yield LoginFailure(result.error);
          return;
        } else {
          prefs.putString(
              SharedPreferencesManager.keyAccessToken, result.token);
          yield LoginSuccess();
        }
      }
    }
  }
}
