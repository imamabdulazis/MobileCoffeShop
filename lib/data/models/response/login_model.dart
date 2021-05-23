

import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';


@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LoginModel {
  int status;
  String message;
  String previlage;
  String token;
  String userId;
  @JsonKey(ignore: true)
  dynamic error;

  LoginModel({
    this.message,
    this.status,
    this.previlage,
    this.token,
    this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginModel.withError(this.error);
}
