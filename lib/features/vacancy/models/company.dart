import 'package:freezed_annotation/freezed_annotation.dart';
part 'company.freezed.dart';
part 'company.g.dart';
List<Company> companyFromJson(dynamic str) =>
    List<Company>.from((str).map((e) => Company.fromJson(e)));

@freezed
abstract class Company with _$Company {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Company({
    String? companyId,
    String? name,
    String? address,
    String? logo,
    String? phoneNumber,
    String? siteLink,
    String? email,
  }) = _Company;
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
