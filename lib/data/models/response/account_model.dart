import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AccountModel {
  String message;
  int status;
  DataAccount data;
  @JsonKey(ignore: true)
  dynamic error;

  AccountModel({
    this.message,
    this.status,
    this.data,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  AccountModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataAccount {
  String id;
  String name;
  String email;
  String username;
  String previlage;
  dynamic telpNumber;
  String imageUrl;

  DataAccount({
    this.id,
    this.name,
    this.email,
    this.username,
    this.previlage,
    this.telpNumber,
    this.imageUrl,
  });

  factory DataAccount.fromJson(Map<String, dynamic> json) =>
      _$DataAccountFromJson(json);

  Map<String, dynamic> toJson() => _$DataAccountToJson(this);
}
