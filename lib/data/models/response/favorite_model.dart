import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FavoriteModel {
  String message;
  int status;
  List<DataFavorite> data;
  @JsonKey(ignore: true)
  dynamic error;

  FavoriteModel({
    this.message,
    this.status,
    this.data,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);

  FavoriteModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataFavorite {
  String id;
  int amount;
  DataDrinkDetail drink;

  DataFavorite({
    this.id,
    this.amount,
    this.drink,
  });

  factory DataFavorite.fromJson(Map<String, dynamic> json) =>
      _$DataFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$DataFavoriteToJson(this);
}
