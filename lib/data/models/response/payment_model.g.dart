// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentGatewayModel _$PaymentGatewayModelFromJson(Map<String, dynamic> json) {
  return PaymentGatewayModel(
    statusCode: json['status_code'] as String,
    statusMessage: json['status_message'] as String,
    transactionId: json['transaction_id'] as String,
    orderId: json['order_id'] as String,
    merchantId: json['merchant_id'] as String,
    grossAmount: json['gross_amount'] as String,
    currency: json['currency'] as String,
    paymentType: json['payment_type'] as String,
    transactionTime: json['transaction_time'] as String,
    transactionStatus: json['transaction_status'] as String,
    fraudStatus: json['fraud_status'] as String,
    actions: (json['actions'] as List)
        ?.map((e) => e == null
            ? null
            : PaymentGatewayAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PaymentGatewayModelToJson(
        PaymentGatewayModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'transaction_id': instance.transactionId,
      'order_id': instance.orderId,
      'merchant_id': instance.merchantId,
      'gross_amount': instance.grossAmount,
      'currency': instance.currency,
      'payment_type': instance.paymentType,
      'transaction_time': instance.transactionTime,
      'transaction_status': instance.transactionStatus,
      'fraud_status': instance.fraudStatus,
      'actions': instance.actions?.map((e) => e?.toJson())?.toList(),
    };

PaymentGatewayAction _$PaymentGatewayActionFromJson(Map<String, dynamic> json) {
  return PaymentGatewayAction(
    name: json['name'] as String,
    method: json['method'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$PaymentGatewayActionToJson(
        PaymentGatewayAction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'method': instance.method,
      'url': instance.url,
    };
