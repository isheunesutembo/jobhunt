// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(Map json) =>
    _$ApplicationModelImpl(
      id: json['_id'] as String?,
      status: json['status'] as String?,
      vacancyId: json['vacancyId'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(Map<String, dynamic>.from(json['company'] as Map)),
      userId: json['userId'] as String?,
      resume: json['resume'] as String?,
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'vacancyId': instance.vacancyId,
      'company': instance.company?.toJson(),
      'userId': instance.userId,
      'resume': instance.resume,
    };
