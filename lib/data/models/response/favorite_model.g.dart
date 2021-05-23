// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return FavoriteModel(
    message: json['message'] as String,
    status: json['status'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataFavorite.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

DataFavorite _$DataFavoriteFromJson(Map<String, dynamic> json) {
  return DataFavorite(
    id: json['id'] as String,
    amount: json['amount'] as int,
    drink: json['drink'] == null
        ? null
        : DataDrinkDetail.fromJson(json['drink'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataFavoriteToJson(DataFavorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'drink': instance.drink?.toJson(),
    };
