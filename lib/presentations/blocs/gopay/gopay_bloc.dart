import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gopay_event.dart';
part 'gopay_state.dart';

class GopayBloc extends Bloc<GopayEvent, GopayState> {
  GopayBloc() : super(GopayInitial());

  @override
  Stream<GopayState> mapEventToState(
    GopayEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
