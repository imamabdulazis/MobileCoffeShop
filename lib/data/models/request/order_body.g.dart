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
    orderStatus: json['order_status'] as String,
    paymentStatus: json['payment_status'] as String,
    amount: json['amount'] as int,
    discount: json['discount'] as int,
    total: json['total'] as int,
    callbackUrl: json['callback_url'] as String,
  );
}

Map<String, dynamic> _$OrderBodyToJson(OrderBody instance) => <String, dynamic>{
      'user_id': instance.userId,
      'payment_method_id': instance.paymentMethodId,
      'drink_id': instance.drinkId,
      'amount': instance.amount,
      'discount': instance.discount,
      'total': instance.total,
      'payment_status': instance.paymentStatus,
      'order_status': instance.orderStatus,
      'callback_url': instance.callbackUrl,
    };
