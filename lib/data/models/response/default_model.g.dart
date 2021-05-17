// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultModel _$DefaultModelFromJson(Map<String, dynamic> json) {
  return DefaultModel(
    status: json['status'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$DefaultModelToJson(DefaultModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
