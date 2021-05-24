// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartBody _$CartBodyFromJson(Map<String, dynamic> json) {
  return CartBody(
    userId: json['user_id'] as String,
    drinkId: json['drink_id'] as String,
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$CartBodyToJson(CartBody instance) => <String, dynamic>{
      'user_id': instance.userId,
      'drink_id': instance.drinkId,
      'amount': instance.amount,
    };
