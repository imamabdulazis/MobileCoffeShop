import 'package:json_annotation/json_annotation.dart';

part 'order_kasir_body.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.snake, createFactory: false)
class OrderKasirBody {
  String userId;
  List<DrinkItemModel> drinks;
  int total;

  OrderKasirBody({
    this.userId,
    this.drinks,
    this.total,
  });

  Map<String, dynamic> toJson() => _$OrderKasirBodyToJson(this);
}

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.snake, createFactory: false)
class DrinkItemModel {
  String id;
  String name;
  String price;
  int quantity;

  DrinkItemModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
  });

  Map<String, dynamic> toJson() => _$DrinkItemModelToJson(this);
}
