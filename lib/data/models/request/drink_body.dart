import 'package:json_annotation/json_annotation.dart';

part 'drink_body.g.dart';

@JsonSerializable(
    createFactory: false, explicitToJson: true, fieldRename: FieldRename.snake)
class DrinkBody {
  String id;
  String name;
  String cat;
  String image;
  String price;
  int quantity;

  DrinkBody({
    this.id,
    this.quantity,
    this.name,
    this.price,
    this.cat,
    this.image,
  });
  Map<String, dynamic> toJson() => _$DrinkBodyToJson(this);

  @override
  String toString() {
    return "{id:$id,quantity:$quantity}";
  }
}
