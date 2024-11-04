import'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'category.freezed.dart';
part 'category.g.dart';

List<Category> jobCategoriesFromJson(dynamic str) =>
   List<Category>.from((str).map((e) => Category.fromJson(e)));
@freezed
abstract class Category with _$Category{
  @JsonSerializable(explicitToJson:true ,anyMap: true)
  factory Category({
    String? title,
    String? image,
    String? categoryId,
  })=_Category;
    factory Category.fromJson(Map<String,dynamic>json)=> _$CategoryFromJson(json);
}
extension CategoryExt on Category{
  String get fullImagePath=>AppConfig.fullImageUrl+image!;
}

