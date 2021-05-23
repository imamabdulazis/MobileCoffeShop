// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_drink_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailDrinkModel _$DetailDrinkModelFromJson(Map<String, dynamic> json) {
  return DetailDrinkModel(
    message: json['message'] as String,
    status: json['status'] as int,
    data: json['data'] == null
        ? null
        : DataDrinkDetail.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DetailDrinkModelToJson(DetailDrinkModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data?.toJson(),
    };

DataDrinkDetail _$DataDrinkDetailFromJson(Map<String, dynamic> json) {
  return DataDrinkDetail(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['image_url'] as String,
    price: json['price'] as String,
    stock: json['stock'] as int,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    category: json['category'] == null
        ? null
        : DataCategory.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataDrinkDetailToJson(DataDrinkDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'stock': instance.stock,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'category': instance.category?.toJson(),
    };

DataCategory _$DataCategoryFromJson(Map<String, dynamic> json) {
  return DataCategory(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$DataCategoryToJson(DataCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
