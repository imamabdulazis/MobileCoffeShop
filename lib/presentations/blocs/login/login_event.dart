part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnChangeLogin extends LoginEvent {
  final LoginBody body;

  OnChangeLogin(this.body);
}
