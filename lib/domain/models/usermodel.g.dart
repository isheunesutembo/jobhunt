// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['_id'] as String,
      username: json['username'] as String?,
      email: json['email'] as String?,
      verification: json['verification'] as bool?,
      phone: json['phone'] as String?,
      userType: json['userType'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
      userToken: json['userToken'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'verification': instance.verification,
      'phone': instance.phone,
      'userType': instance.userType,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'userToken': instance.userToken,
    };
