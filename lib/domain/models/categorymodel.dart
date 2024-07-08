import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'categorymodel.freezed.dart';
part 'categorymodel.g.dart';
List<CategoryModel> categoriesFromJson(dynamic str) =>
   List<CategoryModel>.from((str).map((e) => CategoryModel.fromJson(e)));
@freezed
abstract class CategoryModel with _$CategoryModel{
  factory CategoryModel({
    required String categoryId,
    required String title,
    required String image
  
  })=_CategoryModel;
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelExt on CategoryModel{
  String get fullImagePath=>"${AppConfig.fullImageUrl}/$image";
}