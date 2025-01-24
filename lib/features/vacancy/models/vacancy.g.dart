// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VacancyImpl _$$VacancyImplFromJson(Map json) => _$VacancyImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      requirements: json['requirements'] as String?,
      skillTags: (json['skillTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      experience: json['experience'] as String?,
      salary: json['salary'] as String?,
      benefits: json['benefits'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      company: json['company'] == null
          ? null
          : Company.fromJson(Map<String, dynamic>.from(json['company'] as Map)),
      vacancyId: json['vacancyId'] as String?,
    );

Map<String, dynamic> _$$VacancyImplToJson(_$VacancyImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'requirements': instance.requirements,
      'skillTags': instance.skillTags,
      'experience': instance.experience,
      'salary': instance.salary,
      'benefits': instance.benefits,
      'category': instance.category?.toJson(),
      'company': instance.company?.toJson(),
      'vacancyId': instance.vacancyId,
    };
