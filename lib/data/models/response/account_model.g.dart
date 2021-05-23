// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return AccountModel(
    message: json['message'] as String,
    status: json['status'] as int,
    data: json['data'] == null
        ? null
        : DataAccount.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data?.toJson(),
    };

DataAccount _$DataAccountFromJson(Map<String, dynamic> json) {
  return DataAccount(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    username: json['username'] as String,
    previlage: json['previlage'] as String,
    telpNumber: json['telp_number'] as String,
    imageUrl: json['image_url'] as String,
  );
}

Map<String, dynamic> _$DataAccountToJson(DataAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'previlage': instance.previlage,
      'telp_number': instance.telpNumber,
      'image_url': instance.imageUrl,
    };
