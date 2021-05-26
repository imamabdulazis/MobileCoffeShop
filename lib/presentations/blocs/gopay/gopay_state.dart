part of 'gopay_bloc.dart';

@immutable
abstract class GopayState {}

class GopayInitial extends GopayState {}

class GopayLoading extends GopayState {}

class GopaySuccess extends GopayState {}

class GopayFailure extends GopayState {}
