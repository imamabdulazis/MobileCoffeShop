// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteBody _$FavoriteBodyFromJson(Map<String, dynamic> json) {
  return FavoriteBody(
    userId: json['user_id'] as String,
    drinkId: json['drink_id'] as String,
  );
}

Map<String, dynamic> _$FavoriteBodyToJson(FavoriteBody instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'drink_id': instance.drinkId,
    };
