// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeymentMethodList _$PeymentMethodListFromJson(Map<String, dynamic> json) {
  return PeymentMethodList(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DataPaymentList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PeymentMethodListToJson(PeymentMethodList instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

DataPaymentList _$DataPaymentListFromJson(Map<String, dynamic> json) {
  return DataPaymentList(
    id: json['id'] as String,
    paymentType: json['payment_type'] as String,
    imageUrl: json['image_url'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DataPaymentListToJson(DataPaymentList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_type': instance.paymentType,
      'description': instance.description,
      'image_url': instance.imageUrl,
    };
