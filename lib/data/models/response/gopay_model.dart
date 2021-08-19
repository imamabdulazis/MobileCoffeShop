import 'package:json_annotation/json_annotation.dart';

part 'gopay_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GopayModel {
  int status;
  String message;
  DataGopay data;
  @JsonKey(ignore: true)
  dynamic error;

  GopayModel({
    this.status,
    this.data,
    this.message,
  });

  factory GopayModel.fromJson(Map<String, dynamic> json) =>
      _$GopayModelFromJson(json);

  Map<String, dynamic> toJson() => _$GopayModelToJson(this);

  GopayModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataGopay {
  String id;
  String deeplinkRedirect;
  String generateQrCode;
  String getStatus;
  String noTransaction;
  int total;
  PaymentMethod paymentMethod;

  DataGopay({
    this.id,
    this.deeplinkRedirect,
    this.generateQrCode,
    this.getStatus,
    this.noTransaction,
    this.total,
    this.paymentMethod,
  });

  factory DataGopay.fromJson(Map<String, dynamic> json) =>
      _$DataGopayFromJson(json);

  Map<String, dynamic> toJson() => _$DataGopayToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PaymentMethod {
  String id;
  String paymentType;
  String description;

  PaymentMethod({
    this.id,
    this.paymentType,
    this.description,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
