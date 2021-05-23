import 'package:json_annotation/json_annotation.dart';

part 'detail_drink_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DetailDrinkModel {
  String message;
  int status;
  DataDrinkDetail data;
  @JsonKey(ignore: true)
  dynamic error;

  DetailDrinkModel({
    this.message,
    this.status,
    this.data,
  });

  factory DetailDrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DetailDrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailDrinkModelToJson(this);

  DetailDrinkModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataDrinkDetail {
  String id;
  String name;
  String description;
  String imageUrl;
  String price;
  int stock;
  DateTime updatedAt;
  DataCategory category;

  DataDrinkDetail({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.stock,
    this.updatedAt,
    this.category,
  });

  factory DataDrinkDetail.fromJson(Map<String, dynamic> json) =>
      _$DataDrinkDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DataDrinkDetailToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataCategory {
  String id;
  String name;

  DataCategory({
    this.id,
    this.name,
  });

  factory DataCategory.fromJson(Map<String, dynamic> json) =>
      _$DataCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoryToJson(this);
}
