

import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class RegisterBody {
  final String name;
  final String username;
  final String email;
  final String password;
  final String telpNumber;
  final String previlage;

  RegisterBody({
    this.name,
    this.username,
    this.email,
    this.password,
    this.previlage,
    this.telpNumber,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
