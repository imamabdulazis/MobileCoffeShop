import 'package:json_annotation/json_annotation.dart';

part 'cart_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CartBody {
  String userId;
  String drinkId;

  CartBody({
    this.userId,
    this.drinkId,
  });

  factory CartBody.fromJson(Map<String, dynamic> json) =>
      _$CartBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CartBodyToJson(this);
}
