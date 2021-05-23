import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderModel {
  String status;
  String message;
  DataOrder data;
  @JsonKey(ignore: true)
  dynamic error;

  OrderModel({
    this.status,
    this.data,
    this.message,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  OrderModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataOrder {
  String id;
  String userId;
  String paymentMethodId;
  String drinkId;
  String pickupDate;
  int amount;
  int discount;
  int total;
  String noTransaction;
  String status;
  String paymentStatus;

  DataOrder({
    this.id,
    this.userId,
    this.paymentMethodId,
    this.drinkId,
    this.pickupDate,
    this.amount,
    this.discount,
    this.total,
    this.noTransaction,
    this.status,
    this.paymentStatus,
  });

  factory DataOrder.fromJson(Map<String, dynamic> json) =>
      _$DataOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DataOrderToJson(this);
}
