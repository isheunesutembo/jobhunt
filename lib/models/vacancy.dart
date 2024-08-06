import'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'vacancy.freezed.dart';
part 'vacancy.g.dart';
List<Vacancy> vacanciesFromJson(dynamic str) =>
   List<Vacancy>.from((str).map((e) => Vacancy.fromJson(e)));
@freezed
abstract class Vacancy with _$Vacancy{
factory Vacancy
({
    String? title,
    String? description,
    String? requirements,
    List<String>?skillTags,
    String? experience,
    String? salary,
    String? benefits,
    String? company,
    String? vacancyId,
  })=_Vacancy;
    factory Vacancy.fromJson(Map<String,dynamic>json)=> _$VacancyFromJson(json);
}


