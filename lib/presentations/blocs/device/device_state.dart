part of 'device_bloc.dart';

@immutable
abstract class DeviceState {}

class DeviceInitial extends DeviceState {}

class DeviceSuccess extends DeviceState {}

class DeviceFailure extends DeviceState {
  final String message;

  DeviceFailure(this.message);
}
