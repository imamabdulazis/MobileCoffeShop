// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceBody _$DeviceBodyFromJson(Map<String, dynamic> json) {
  return DeviceBody(
    userId: json['user_id'] as String,
    phoneId: json['phone_id'] as String,
    fcmToken: json['fcm_token'] as String,
    manufacture: json['manufacture'] as String,
    systemVersion: json['system_version'] as String,
    systemOs: json['system_os'] as String,
    osName: json['os_name'] as String,
    appVersion: json['app_version'] as String,
  );
}

Map<String, dynamic> _$DeviceBodyToJson(DeviceBody instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'phone_id': instance.phoneId,
      'fcm_token': instance.fcmToken,
      'manufacture': instance.manufacture,
      'system_version': instance.systemVersion,
      'system_os': instance.systemOs,
      'os_name': instance.osName,
      'app_version': instance.appVersion,
    };
