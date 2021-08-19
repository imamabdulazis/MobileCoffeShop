import 'package:caffeshop/data/models/response/detail_drink_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CartModel {
  String message;
  int status;
  String user;
  List<DataCart> data;
  @JsonKey(ignore: true)
  dynamic error;

  CartModel({
    this.message,
    this.status,
    this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  CartModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataCart {
  String id;
  String cartId;
  int quantity;
  DateTime updatedAt;
  DataDrinkDetail drink;

  DataCart({
    this.id,
    this.quantity,
    this.drink,
  });

  factory DataCart.fromJson(Map<String, dynamic> json) =>
      _$DataCartFromJson(json);

  Map<String, dynamic> toJson() => _$DataCartToJson(this);
}
