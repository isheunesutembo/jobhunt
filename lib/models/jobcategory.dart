import'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'jobcategory.freezed.dart';
part 'jobcategory.g.dart';

List<JobCategory> jobCategoriesFromJson(dynamic str) =>
   List<JobCategory>.from((str).map((e) => JobCategory.fromJson(e)));
@freezed
abstract class JobCategory with _$JobCategory{
 
  factory JobCategory({
    String? title,
    String? image,
    String? categoryId,
  })=_JobCategory;
    factory JobCategory.fromJson(Map<String,dynamic>json)=> _$JobCategoryFromJson(json);
}

