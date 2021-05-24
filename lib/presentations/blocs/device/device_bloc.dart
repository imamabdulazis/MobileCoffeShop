import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeshop/data/models/request/device_body.dart';
import 'package:caffeshop/data/models/response/default_model.dart';
import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:meta/meta.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final ApiProvider provider = ApiProvider();
  DeviceBloc() : super(DeviceInitial());

  @override
  Stream<DeviceState> mapEventToState(
    DeviceEvent event,
  ) async* {
    if (event is OnDeviceEvent) {
      DefaultModel model = await provider.postDevice(event.body);
      if (model.error != null) {
        yield DeviceFailure(model.error);
        return;
      } else {
        yield DeviceSuccess();
        return;
      }
    }
  }
}
