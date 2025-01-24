// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map json) => _$UserModelImpl(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      verification: json['verification'] as bool?,
      phone: json['phone'] as String?,
      userType: json['userType'] as String?,
      userToken: json['userToken'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'verification': instance.verification,
      'phone': instance.phone,
      'userType': instance.userType,
      'userToken': instance.userToken,
      'profileImage': instance.profileImage,
    };
