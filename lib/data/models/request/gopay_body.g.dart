// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gopay_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GopayBody _$GopayBodyFromJson(Map<String, dynamic> json) {
  return GopayBody(
    callbackUrl: json['callback_url'] as String,
    orderId: json['order_id'] as String,
  );
}

Map<String, dynamic> _$GopayBodyToJson(GopayBody instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'callback_url': instance.callbackUrl,
    };
