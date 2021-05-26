// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartBody _$UpdateCartBodyFromJson(Map<String, dynamic> json) {
  return UpdateCartBody(
    drinkId: json['drink_id'] as String,
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$UpdateCartBodyToJson(UpdateCartBody instance) =>
    <String, dynamic>{
      'drink_id': instance.drinkId,
      'amount': instance.amount,
    };
