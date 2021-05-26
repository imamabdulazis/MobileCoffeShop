import 'package:json_annotation/json_annotation.dart';

part 'update_cart_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UpdateCartBody {
  String drinkId;
  int amount;

  UpdateCartBody({this.drinkId, this.amount});
  factory UpdateCartBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartBodyToJson(this);
}
