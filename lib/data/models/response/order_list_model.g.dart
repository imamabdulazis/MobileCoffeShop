// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModel _$OrderListModelFromJson(Map<String, dynamic> json) {
  return OrderListModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DataOrderList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$OrderListModelToJson(OrderListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

DataOrderList _$DataOrderListFromJson(Map<String, dynamic> json) {
  return DataOrderList(
    id: json['id'] as String,
    noTransaction: json['no_transaction'] as String,
    total: json['total'] as int,
    amount: json['amount'] as int,
    discount: json['discount'] as int,
    paymentStatus: json['payment_status'] as String,
    orderStatus: json['order_status'] as String,
    deeplinkRedirect: json['deeplink_redirect'] as String,
    generateQrCode: json['generate_qr_code'] as String,
    getStatus: json['get_status'] as String,
    drink: json['drink'] == null
        ? null
        : DataDrinkOrder.fromJson(json['drink'] as Map<String, dynamic>),
  )
    ..paymentMethod = json['payment_method'] == null
        ? null
        : OrderPaymentMethod.fromJson(
            json['payment_method'] as Map<String, dynamic>)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$DataOrderListToJson(DataOrderList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_transaction': instance.noTransaction,
      'total': instance.total,
      'amount': instance.amount,
      'discount': instance.discount,
      'payment_status': instance.paymentStatus,
      'order_status': instance.orderStatus,
      'deeplink_redirect': instance.deeplinkRedirect,
      'generate_qr_code': instance.generateQrCode,
      'get_status': instance.getStatus,
      'drink': instance.drink?.toJson(),
      'payment_method': instance.paymentMethod?.toJson(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

DataDrinkOrder _$DataDrinkOrderFromJson(Map<String, dynamic> json) {
  return DataDrinkOrder(
    id: json['id'] as String,
    name: json['name'] as String,
    price: json['price'] as String,
  );
}

Map<String, dynamic> _$DataDrinkOrderToJson(DataDrinkOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

OrderPaymentMethod _$OrderPaymentMethodFromJson(Map<String, dynamic> json) {
  return OrderPaymentMethod(
    id: json['id'] as String,
    paymentType: json['payment_type'] as String,
  );
}

Map<String, dynamic> _$OrderPaymentMethodToJson(OrderPaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_type': instance.paymentType,
    };
