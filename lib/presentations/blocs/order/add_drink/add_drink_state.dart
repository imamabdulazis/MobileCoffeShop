part of 'add_drink_bloc.dart';

@immutable
abstract class AddDrinkState {}

class AddDrinkInitial extends AddDrinkState {}

class AddDrinkSuccess extends AddDrinkState {}

class AddDrinkFailure extends AddDrinkState {}
