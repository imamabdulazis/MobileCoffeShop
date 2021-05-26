import 'package:json_annotation/json_annotation.dart';

part 'transaction_status.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TransactionStatusModel {
  String transactionTime;
  String grossAmount;
  String currency;
  String orderId;
  String paymentType;
  String signatureKey;
  String statusCode;
  String transactionId;
  String transactionStatus;
  String fraudStatus;
  String statusMessage;
  String merchantId;
  @JsonKey(ignore: true)
  String error;

  TransactionStatusModel({
    this.transactionTime,
    this.grossAmount,
    this.currency,
    this.orderId,
    this.paymentType,
    this.signatureKey,
    this.statusCode,
    this.transactionId,
    this.transactionStatus,
    this.fraudStatus,
    this.statusMessage,
    this.merchantId,
  });

  factory TransactionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionStatusModelToJson(this);

  TransactionStatusModel.withError(this.error);
}
