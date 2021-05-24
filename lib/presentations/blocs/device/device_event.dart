part of 'device_bloc.dart';

@immutable
abstract class DeviceEvent {}

class OnDeviceEvent extends DeviceEvent {
  final DeviceBody body;

  OnDeviceEvent(this.body);
}
