import 'package:json_annotation/json_annotation.dart';

part 'device_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DeviceBody {
  String userId;
  String phoneId;
  String fcmToken;
  String manufacture;
  String systemVersion;
  String systemOs;
  String osName;
  String appVersion;

  DeviceBody({
    this.userId,
    this.phoneId,
    this.fcmToken,
    this.manufacture,
    this.systemVersion,
    this.systemOs,
    this.osName,
    this.appVersion,
  });

  factory DeviceBody.fromJson(Map<String, dynamic> json) =>
      _$DeviceBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceBodyToJson(this);
}
