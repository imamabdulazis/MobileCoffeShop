import 'package:json_annotation/json_annotation.dart';

part 'favorite_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FavoriteBody {
  String userId;
  String drinkId;

  FavoriteBody({
    this.userId,
    this.drinkId,
  });

  factory FavoriteBody.fromJson(Map<String, dynamic> json) =>
      _$FavoriteBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteBodyToJson(this);
}
