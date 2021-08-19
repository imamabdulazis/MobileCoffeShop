// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailOrderModel _$DetailOrderModelFromJson(Map<String, dynamic> json) {
  return DetailOrderModel(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : DetailOrderData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

DetailOrderData _$DetailOrderDataFromJson(Map<String, dynamic> json) {
  return DetailOrderData(
    id: json['id'] as String,
    orderItems: (json['order_items'] as List)
        ?.map((e) =>
            e == null ? null : OrderItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noTransaction: json['no_transaction'] as String,
    paymentMethod: json['payment_method'] == null
        ? null
        : PaymentMethod.fromJson(
            json['payment_method'] as Map<String, dynamic>),
    pickupDate: json['pickup_date'] == null
        ? null
        : DateTime.parse(json['pickup_date'] as String),
    status: json['status'] as String,
    paymentStatus: json['payment_status'] as String,
    total: json['total'] as int,
    transactionToken: json['transaction_token'] as String,
    deeplinkRedirect: json['deeplink_redirect'] as String,
    generateQrcode: json['generate_qrcode'] as String,
    getStatusOrder: json['get_status_order'] as String,
    postCancelOrder: json['post_cancel_order'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) {
  return OrderItems(
    id: json['id'] as String,
    quantity: json['quantity'] as int,
    drink: json['drink'] == null
        ? null
        : DrinkData.fromJson(json['drink'] as Map<String, dynamic>),
  );
}
