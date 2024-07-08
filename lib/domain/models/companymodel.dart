import 'package:freezed_annotation/freezed_annotation.dart';
part 'companymodel.freezed.dart';
part 'companymodel.g.dart';
@freezed
abstract class CompanyModel with _$CompanyModel {

  factory CompanyModel({
    @JsonKey(name: '_id')required String id,
    required String name,
    required String address,
    String? logo,
    required String phoneNumber,
    String? siteLink,
    required String email,
    bool? approved
  }) = _CompanyModel;
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}
