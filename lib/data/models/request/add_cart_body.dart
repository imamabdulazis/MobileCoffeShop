import 'package:json_annotation/json_annotation.dart';

part 'add_cart_body.g.dart';

@JsonSerializable(
    createFactory: false, explicitToJson: true, fieldRename: FieldRename.snake)
class AddCartBody {
  String userId;
  String drinkId;
  int quantity;

  AddCartBody({
    this.userId,
    this.drinkId,
    this.quantity,
  });

  Map<String, dynamic> toJson() => _$AddCartBodyToJson(this);
}
