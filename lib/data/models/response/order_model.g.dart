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
    deeplinkRedirect: json['deeplink_redirect'] as String,
    generateQrCode: json['generate_qr_code'] as String,
    getStatus: json['get_status'] as String,
    noTransaction: json['no_transaction'] as String,
    total: json['total'] as int,
  )..paymentMethod = json['payment_method'] == null
      ? null
      : PaymentMethod.fromJson(json['payment_method'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DataOrderToJson(DataOrder instance) => <String, dynamic>{
      'id': instance.id,
      'deeplink_redirect': instance.deeplinkRedirect,
      'generate_qr_code': instance.generateQrCode,
      'get_status': instance.getStatus,
      'no_transaction': instance.noTransaction,
      'total': instance.total,
      'payment_method': instance.paymentMethod?.toJson(),
    };

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return PaymentMethod(
    id: json['id'] as String,
    paymentType: json['payment_type'] as String,
  );
}

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_type': instance.paymentType,
    };
