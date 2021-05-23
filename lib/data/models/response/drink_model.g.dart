// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkModel _$DrinkModelFromJson(Map<String, dynamic> json) {
  return DrinkModel(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DrinkData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DrinkModelToJson(DrinkModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

DrinkData _$DrinkDataFromJson(Map<String, dynamic> json) {
  return DrinkData(
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
        : DrinkCategory.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DrinkDataToJson(DrinkData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'stock': instance.stock,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'category': instance.category?.toJson(),
    };

DrinkCategory _$DrinkCategoryFromJson(Map<String, dynamic> json) {
  return DrinkCategory(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$DrinkCategoryToJson(DrinkCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
