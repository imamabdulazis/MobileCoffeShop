// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gopay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GopayModel _$GopayModelFromJson(Map<String, dynamic> json) {
  return GopayModel(
    status: json['status'] as int,
    data: json['data'] == null
        ? null
        : DataGopay.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$GopayModelToJson(GopayModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

DataGopay _$DataGopayFromJson(Map<String, dynamic> json) {
  return DataGopay(
    id: json['id'] as String,
    deeplinkRedirect: json['deeplink_redirect'] as String,
    generateQrCode: json['generate_qr_code'] as String,
    getStatus: json['get_status'] as String,
    noTransaction: json['no_transaction'] as String,
    total: json['total'] as int,
    paymentMethod: json['payment_method'] == null
        ? null
        : PaymentMethod.fromJson(
            json['payment_method'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataGopayToJson(DataGopay instance) => <String, dynamic>{
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
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_type': instance.paymentType,
      'description': instance.description,
    };
