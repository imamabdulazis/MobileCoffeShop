import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_all_cart_event.dart';
part 'delete_all_cart_state.dart';

class DeleteAllCartBloc extends Bloc<DeleteAllCartEvent, DeleteAllCartState> {
  DeleteAllCartBloc() : super(DeleteAllCartInitial());

  @override
  Stream<DeleteAllCartState> mapEventToState(
    DeleteAllCartEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
