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
  final ApiProvier apiProvider = ApiProvier();
  final SharedPreferencesManager prefs = locator<SharedPreferencesManager>();
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnChangeLogin) {
      LoginBody loginBody = event.body;
      if (loginBody.username == null || loginBody.username.isEmpty) {
        yield LoginException("Email tidak boleh kosong");
      } else if (loginBody.password == null || loginBody.password.isEmpty) {
        yield LoginException("Password tidak boleh kosong");
      } else {
        yield LoginLoading();
        LoginModel result = await apiProvider.postLogin(event.body);

        if (result.error != null) {
          if (result.status == 422) {
            print(result.error);
          } else {
            print("IMAMAMAM:${result.error}");
            yield LoginFailure("Terjadi kesalahan");
            return;
          }
        }
        prefs.putString(SharedPreferencesManager.keyAccessToken, result.token);
        yield LoginSuccess();
      }
    }
  }
}
