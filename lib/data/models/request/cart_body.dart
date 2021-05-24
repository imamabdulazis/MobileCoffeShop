import 'package:json_annotation/json_annotation.dart';

part 'cart_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CartBody {
  String userId;
  String drinkId;
  int amount;

  CartBody({
    this.userId,
    this.drinkId,
    this.amount,
  });

  factory CartBody.fromJson(Map<String, dynamic> json) =>
      _$CartBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CartBodyToJson(this);
}
