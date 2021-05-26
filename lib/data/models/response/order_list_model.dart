import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderListModel {
  int status;
  String message;
  List<DataOrderList> data;
  @JsonKey(ignore:true)
  String error;

  OrderListModel({
    this.data,
    this.message,
    this.status,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) =>
      _$OrderListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListModelToJson(this);

  OrderListModel.withError(this.error);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataOrderList {
  String id;
  String noTransaction;
  int total;
  int amount;
  int discount;
  String paymentStatus;
  String orderStatus;
  String deeplinkRedirect;
  String generateQrCode;
  String getStatus;
  DataDrinkOrder drink;
  OrderPaymentMethod paymentMethod;
  DateTime updatedAt;

  DataOrderList({
    this.id,
    this.noTransaction,
    this.total,
    this.amount,
    this.discount,
    this.paymentStatus,
    this.orderStatus,
    this.deeplinkRedirect,
    this.generateQrCode,
    this.getStatus,
    this.drink,
  });

  factory DataOrderList.fromJson(Map<String, dynamic> json) =>
      _$DataOrderListFromJson(json);

  Map<String, dynamic> toJson() => _$DataOrderListToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataDrinkOrder {
  String id;
  String name;
  String price;

  DataDrinkOrder({
    this.id,
    this.name,
    this.price,
  });

  factory DataDrinkOrder.fromJson(Map<String, dynamic> json) =>
      _$DataDrinkOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DataDrinkOrderToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OrderPaymentMethod {
  String id;
  String paymentType;

  OrderPaymentMethod({
    this.id,
    this.paymentType,
  });

  factory OrderPaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPaymentMethodToJson(this);
}
