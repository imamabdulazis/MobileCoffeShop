import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/register_body.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is OnRegisterEvent) {
      RegisterBody registerBody = event.body;
      if (registerBody.name == null || registerBody.name.isEmpty) {
        yield RegisterException("Nama tidak boleh kosong");
      } else if (registerBody.telpNumber == null ||
          registerBody.telpNumber.isEmpty) {
        yield RegisterException(
            "Nomor telepon tidak boleh kosong tidak boleh kosong");
      } else if (registerBody.username == null ||
          registerBody.username.isEmpty) {
        yield RegisterException("Username tidak boleh kosong");
      } else if (registerBody.password == null ||
          registerBody.password.isEmpty) {
        yield RegisterException("Password tidak boleh kosong");
      } else {
        
      }
    }
  }
}
