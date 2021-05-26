import 'package:json_annotation/json_annotation.dart';

part 'order_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderBody {
  String userId;
  String paymentMethodId;
  String drinkId;
  int amount;
  int discount;
  int total;
  String paymentStatus;
  String orderStatus;

  OrderBody({
    this.userId,
    this.paymentMethodId,
    this.drinkId,
    this.orderStatus,
    this.paymentStatus,
    this.amount,
    this.discount,
    this.total,

  });

  factory OrderBody.fromJson(Map<String, dynamic> json) =>
      _$OrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBodyToJson(this);
}
