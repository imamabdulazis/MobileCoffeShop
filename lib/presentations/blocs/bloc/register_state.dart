part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}

class RegisterSuccess extends RegisterState {}

class RegisterException extends RegisterState {
  final String message;

  RegisterException(this.message);
}
