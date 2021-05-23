// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    message: json['message'] as String,
    status: json['status'] as int,
    previlage: json['previlage'] as String,
    token: json['token'] as String,
    userId: json['user_id'] as String,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'previlage': instance.previlage,
      'token': instance.token,
      'user_id': instance.userId,
    };
