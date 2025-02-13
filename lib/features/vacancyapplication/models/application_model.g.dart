// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(Map json) =>
    _$ApplicationModelImpl(
      id: json['_id'] as String?,
      status: json['status'] as bool?,
      vacancyId: json['vacancyId'] as String?,
      company: json['company'] as String?,
      userId: json['userId'] as String?,
      resume: json['resume'] as String?,
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'vacancyId': instance.vacancyId,
      'company': instance.company,
      'userId': instance.userId,
      'resume': instance.resume,
    };
