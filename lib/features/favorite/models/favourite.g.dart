// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteImpl _$$FavouriteImplFromJson(Map json) => _$FavouriteImpl(
      vacancy: json['vacancy'] == null
          ? null
          : Vacancy.fromJson(Map<String, dynamic>.from(json['vacancy'] as Map)),
      userId: json['userId'] as String?,
      favoriteId: json['favoriteId'] as String?,
    );

Map<String, dynamic> _$$FavouriteImplToJson(_$FavouriteImpl instance) =>
    <String, dynamic>{
      'vacancy': instance.vacancy?.toJson(),
      'userId': instance.userId,
      'favoriteId': instance.favoriteId,
    };
