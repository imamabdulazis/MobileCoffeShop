import 'package:caffeshop/data/models/response/drink_model.dart';
import 'package:caffeshop/data/models/response/gopay_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_order_model.g.dart';

@JsonSerializable(
    explicitToJson: true, createToJson: false, fieldRename: FieldRename.snake)
class DetailOrderModel {
  int status;
  String message;
  DetailOrderData data;
  @JsonKey(ignore: true)
  dynamic error;

  DetailOrderModel({this.status, this.message, this.data});

  factory DetailOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DetailOrderModelFromJson(json);

  DetailOrderModel.withError(this.error);
}

@JsonSerializable(
    explicitToJson: true, createToJson: false, fieldRename: FieldRename.snake)
class DetailOrderData {
  String id;
  List<OrderItems> orderItems;
  String noTransaction;
  PaymentMethod paymentMethod;
  DateTime pickupDate;
  String status;
  String paymentStatus;
  int total;
  String transactionToken;
  String deeplinkRedirect;
  String generateQrcode;
  String getStatusOrder;
  String postCancelOrder;
  DateTime createdAt;
  DateTime updatedAt;

  DetailOrderData({
    this.id,
    this.orderItems,
    this.noTransaction,
    this.paymentMethod,
    this.pickupDate,
    this.status,
    this.paymentStatus,
    this.total,
    this.transactionToken,
    this.deeplinkRedirect,
    this.generateQrcode,
    this.getStatusOrder,
    this.postCancelOrder,
    this.createdAt,
    this.updatedAt,
  });

  factory DetailOrderData.fromJson(Map<String, dynamic> json) =>
      _$DetailOrderDataFromJson(json);
}

@JsonSerializable(
    explicitToJson: true, createToJson: false, fieldRename: FieldRename.snake)
class OrderItems {
  String id;
  int quantity;
  DrinkData drink;

  OrderItems({
    this.id,
    this.quantity,
    this.drink,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsFromJson(json);
}
