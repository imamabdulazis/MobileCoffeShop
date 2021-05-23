import 'package:json_annotation/json_annotation.dart';

part 'order_body.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderBody {
  String userId;
  String paymentMethodId;
  String drinkId;
  String pickupDate;
  int amount;
  int discount;
  int total;
  String status;

  OrderBody({
    this.userId,
    this.paymentMethodId,
    this.drinkId,
    this.pickupDate,
    this.amount,
    this.total,
    this.status,
  });

  factory OrderBody.fromJson(Map<String, dynamic> json) =>
      _$OrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBodyToJson(this);
}
