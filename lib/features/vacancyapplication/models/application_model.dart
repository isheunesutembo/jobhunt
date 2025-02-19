import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/resume/models/resume.dart';
import 'package:jobhunt/features/vacancy/models/company.dart';
part 'application_model.freezed.dart';
part 'application_model.g.dart';

List<ApplicationModel> applicationFromJson(dynamic str) =>
    List<ApplicationModel>.from((str).map((e) => ApplicationModel.fromJson(e)));

@freezed
abstract class ApplicationModel with _$ApplicationModel {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory ApplicationModel({
  @JsonKey(name: "_id") 
  String? id,
  String? status,
  Company? company,
  Resume? resume,
  String? userId,
  String? vacancyId,
  String? createdAt,
  String? updatedAt,
 
  }) = _ApplicationModel;
  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
