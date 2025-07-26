// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(Map json) =>
    _$ApplicationModelImpl(
      id: json['_id'] as String?,
      status: json['status'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(Map<String, dynamic>.from(json['company'] as Map)),
      resume: json['resume'] == null
          ? null
          : Resume.fromJson(Map<String, dynamic>.from(json['resume'] as Map)),
      userId: json['userId'] as String?,
      vacancyId: json['vacancyId'] == null
          ? null
          : Vacancy.fromJson(
              Map<String, dynamic>.from(json['vacancyId'] as Map)),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'company': instance.company?.toJson(),
      'resume': instance.resume?.toJson(),
      'userId': instance.userId,
      'vacancyId': instance.vacancyId?.toJson(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
