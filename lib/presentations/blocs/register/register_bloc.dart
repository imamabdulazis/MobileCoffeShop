import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/register_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiProvider apiProvider = ApiProvider();
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is OnRegisterEvent) {
      RegisterBody registerBody = event.body;
      if (registerBody.name == null || registerBody.name.isEmpty) {
        yield RegisterException("Nama tidak boleh kosong");
      } else if (registerBody.username == null ||
          registerBody.username.isEmpty) {
        yield RegisterException("Username tidak boleh kosong");
      } else if (registerBody.email == null || registerBody.username.isEmpty) {
        yield RegisterException(
          "Email tidak boleh kosong",
        );
      } else if (registerBody.telpNumber == null ||
          registerBody.telpNumber.isEmpty) {
        yield RegisterException(
            "Nomor telepon tidak boleh kosong tidak boleh kosong");
      } else if (registerBody.password == null ||
          registerBody.password.isEmpty) {
        yield RegisterException("Password tidak boleh kosong");
      } else {
        yield RegisterLoading();

        DefaultModel result = await apiProvider.postRegister(event.body);

        if (result.error != null) {
          yield RegisterFailure(result.error);
          return;
        } else {
          yield RegisterSuccess();
        }
      }
    }
  }
}
