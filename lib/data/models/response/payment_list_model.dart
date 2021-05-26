import 'package:json_annotation/json_annotation.dart';

part 'payment_list_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PeymentMethodList {
  String message;
  int status;
  List<DataPaymentList> data;
  @JsonKey(ignore: true)
  String error;

  PeymentMethodList({
    this.status,
    this.message,
    this.data,
  });

  factory PeymentMethodList.fromJson(Map<String, dynamic> json) =>
      _$PeymentMethodListFromJson(json);

  Map<String, dynamic> toJson() => _$PeymentMethodListToJson(this);

  PeymentMethodList.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataPaymentList {
  String id;
  String paymentType;
  String description;
  String imageUrl;

  DataPaymentList({
    this.id,
    this.paymentType,
    this.imageUrl,
    this.description,
  });

  factory DataPaymentList.fromJson(Map<String, dynamic> json) =>
      _$DataPaymentListFromJson(json);

  Map<String, dynamic> toJson() => _$DataPaymentListToJson(this);
}
