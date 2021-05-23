// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBody _$OrderBodyFromJson(Map<String, dynamic> json) {
  return OrderBody(
    userId: json['user_id'] as String,
    paymentMethodId: json['payment_method_id'] as String,
    drinkId: json['drink_id'] as String,
    pickupDate: json['pickup_date'] as String,
    amount: json['amount'] as int,
    total: json['total'] as int,
    status: json['status'] as String,
  )..discount = json['discount'] as int;
}

Map<String, dynamic> _$OrderBodyToJson(OrderBody instance) => <String, dynamic>{
      'user_id': instance.userId,
      'payment_method_id': instance.paymentMethodId,
      'drink_id': instance.drinkId,
      'pickup_date': instance.pickupDate,
      'amount': instance.amount,
      'discount': instance.discount,
      'total': instance.total,
      'status': instance.status,
    };
