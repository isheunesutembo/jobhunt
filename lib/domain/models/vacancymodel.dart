import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'vacancymodel.freezed.dart';
part 'vacancymodel.g.dart';
List<VacancyModel>vacanciesFromJson(dynamic str) =>
   List<VacancyModel>.from((str).map((e) => VacancyModel.fromJson(e)));
@freezed
abstract class VacancyModel with _$VacancyModel{
  factory VacancyModel({
    required String title,
   required String vacancyId,
   required String description,
   required String requirements,
   required List<String>skillTags,
   required String salary,
   required String experience,
   String? category,
   required String company,
   
  
  })=_VacancyModel;
  factory VacancyModel.fromJson(Map<String, dynamic> json) =>
      _$VacancyModelFromJson(json);
}