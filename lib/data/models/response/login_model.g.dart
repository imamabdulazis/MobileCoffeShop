// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    json['message'] as String,
    json['previlage'] as String,
    json['token'] as String,
  )..error = json['error'] as String;
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'previlage': instance.previlage,
      'token': instance.token,
      'error': instance.error,
    };
