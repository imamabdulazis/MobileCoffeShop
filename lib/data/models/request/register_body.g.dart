// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBody _$RegisterBodyFromJson(Map<String, dynamic> json) {
  return RegisterBody(
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    previlage: json['previlage'] as String,
    telpNumber: json['telp_number'] as String,
  );
}

Map<String, dynamic> _$RegisterBodyToJson(RegisterBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'telp_number': instance.telpNumber,
      'previlage': instance.previlage,
    };
