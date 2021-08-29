// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_kasir_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OrderKasirBodyToJson(OrderKasirBody instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'drinks': instance.drinks?.map((e) => e?.toJson())?.toList(),
      'total': instance.total,
    };

Map<String, dynamic> _$DrinkItemModelToJson(DrinkItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
    };
