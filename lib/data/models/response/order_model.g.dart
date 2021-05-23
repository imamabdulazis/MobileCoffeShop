// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    status: json['status'] as String,
    data: json['data'] == null
        ? null
        : DataOrder.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

DataOrder _$DataOrderFromJson(Map<String, dynamic> json) {
  return DataOrder(
    id: json['id'] as String,
    userId: json['user_id'] as String,
    paymentMethodId: json['payment_method_id'] as String,
    drinkId: json['drink_id'] as String,
    pickupDate: json['pickup_date'] as String,
    amount: json['amount'] as int,
    discount: json['discount'] as int,
    total: json['total'] as int,
    noTransaction: json['no_transaction'] as String,
    status: json['status'] as String,
    paymentStatus: json['payment_status'] as String,
  );
}

Map<String, dynamic> _$DataOrderToJson(DataOrder instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'payment_method_id': instance.paymentMethodId,
      'drink_id': instance.drinkId,
      'pickup_date': instance.pickupDate,
      'amount': instance.amount,
      'discount': instance.discount,
      'total': instance.total,
      'no_transaction': instance.noTransaction,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
    };
