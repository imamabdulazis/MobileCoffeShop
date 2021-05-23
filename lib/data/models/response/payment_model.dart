import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PaymentGatewayModel {
  String statusCode;
  String statusMessage;
  String transactionId;
  String orderId;
  String merchantId;
  String grossAmount;
  String currency;
  String paymentType;
  String transactionTime;
  String transactionStatus;
  String fraudStatus;
  List<PaymentGatewayAction> actions;
  @JsonKey(ignore: true)
  dynamic error;

  PaymentGatewayModel({
    this.statusCode,
    this.statusMessage,
    this.transactionId,
    this.orderId,
    this.merchantId,
    this.grossAmount,
    this.currency,
    this.paymentType,
    this.transactionTime,
    this.transactionStatus,
    this.fraudStatus,
    this.actions,
  });

  factory PaymentGatewayModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayModelToJson(this);

  PaymentGatewayModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PaymentGatewayAction {
  String name;
  String method;
  String url;

  PaymentGatewayAction({
    this.name,
    this.method,
    this.url,
  });

  factory PaymentGatewayAction.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayActionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayActionToJson(this);
}
