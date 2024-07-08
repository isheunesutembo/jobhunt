// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VacancyModelImpl _$$VacancyModelImplFromJson(Map<String, dynamic> json) =>
    _$VacancyModelImpl(
      title: json['title'] as String,
      vacancyId: json['vacancyId'] as String,
      description: json['description'] as String,
      requirements: json['requirements'] as String,
      skillTags:
          (json['skillTags'] as List<dynamic>).map((e) => e as String).toList(),
      salary: json['salary'] as String,
      experience: json['experience'] as String,
      category: json['category'] as String?,
      company: json['company'] as String,
    );

Map<String, dynamic> _$$VacancyModelImplToJson(_$VacancyModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'vacancyId': instance.vacancyId,
      'description': instance.description,
      'requirements': instance.requirements,
      'skillTags': instance.skillTags,
      'salary': instance.salary,
      'experience': instance.experience,
      'category': instance.category,
      'company': instance.company,
    };
