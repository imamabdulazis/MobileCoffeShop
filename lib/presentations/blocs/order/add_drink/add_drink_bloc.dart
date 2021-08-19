import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_drink_event.dart';
part 'add_drink_state.dart';

class AddDrinkBloc extends Bloc<AddDrinkEvent, AddDrinkState> {
  AddDrinkBloc() : super(AddDrinkInitial());

  @override
  Stream<AddDrinkState> mapEventToState(
    AddDrinkEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
