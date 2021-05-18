

import 'package:json_annotation/json_annotation.dart';

part 'default_model.g.dart';

@JsonSerializable()
class DefaultModel {
  int status;
  String message;
  @JsonKey(ignore: true)
  dynamic error;

  DefaultModel({
    this.status,
    this.message,
  });

  factory DefaultModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultModelToJson(this);

  DefaultModel.withError(this.error);
}
