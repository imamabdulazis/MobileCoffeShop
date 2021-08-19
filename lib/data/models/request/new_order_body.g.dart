// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NewOrderBodyToJson(NewOrderBody instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'cart_id': instance.cartId,
      'drinks': instance.drinks?.map((e) => e?.toJson())?.toList(),
      'payment_method_id': instance.paymentMethodId,
      'total': instance.total,
    };
