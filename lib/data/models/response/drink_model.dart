import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DrinkModel {
  final int status;
  final String message;
  final List<DrinkData> data;

  DrinkModel({
    this.status,
    this.message,
    this.data,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DrinkData {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  final String stock;
  final DateTime updatedAt;
  final DrinkCategory category;

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
  final String id;
  final String name;

  DrinkCategory({
    this.id,
    this.name,
  });

  factory DrinkCategory.fromJson(Map<String, dynamic> json) =>
      _$DrinkCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkCategoryToJson(this);
}
