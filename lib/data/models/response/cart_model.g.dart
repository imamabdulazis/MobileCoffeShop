// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
    message: json['message'] as String,
    status: json['status'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataCart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..user = json['user'] as String;
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'user': instance.user,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

DataCart _$DataCartFromJson(Map<String, dynamic> json) {
  return DataCart(
    id: json['id'] as String,
    quantity: json['quantity'] as int,
    drink: json['drink'] == null
        ? null
        : DataDrinkDetail.fromJson(json['drink'] as Map<String, dynamic>),
  )
    ..cartId = json['cart_id'] as String
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$DataCartToJson(DataCart instance) => <String, dynamic>{
      'id': instance.id,
      'cart_id': instance.cartId,
      'quantity': instance.quantity,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'drink': instance.drink?.toJson(),
    };
