import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CategoryModel {
  int status;
  String message;
  List<DataCategory> data;
  @JsonKey(ignore: true)
  dynamic error;

  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataCategory {
  String id;
  String name;
  String description;

  DataCategory({
    this.id,
    this.name,
    this.description,
  });

  factory DataCategory.fromJson(Map<String, dynamic> json) =>
      _$DataCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoryToJson(this);
}
