

import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DrinkModel {
  int status;
  String message;
  List<DrinkData> data;
  @JsonKey(ignore: true)
  dynamic error;

  DrinkModel({
    this.status,
    this.message,
    this.data,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);

  DrinkModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DrinkData {
  String id;
  String name;
  String description;
  String imageUrl;
  String price;
  String stock;
  DateTime updatedAt;
  DrinkCategory category;

  DrinkData({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.stock,
    this.updatedAt,
    this.category,
  });

  factory DrinkData.fromJson(Map<String, dynamic> json) =>
      _$DrinkDataFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkDataToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DrinkCategory {
  String id;
  String name;

  DrinkCategory({
    this.id,
    this.name,
  });

  factory DrinkCategory.fromJson(Map<String, dynamic> json) =>
      _$DrinkCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkCategoryToJson(this);
}
