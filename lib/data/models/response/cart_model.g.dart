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
  );
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

DataCart _$DataCartFromJson(Map<String, dynamic> json) {
  return DataCart(
    id: json['id'] as String,
    amount: json['amount'] as int,
    drink: json['drink'] == null
        ? null
        : DataDrinkDetail.fromJson(json['drink'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataCartToJson(DataCart instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'drink': instance.drink?.toJson(),
    };
