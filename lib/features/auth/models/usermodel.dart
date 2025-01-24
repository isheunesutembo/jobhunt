import 'package:freezed_annotation/freezed_annotation.dart';
part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory UserModel(
      {@JsonKey(name: "_id") String? id,
      String? username,
      String? email,
      bool? verification,
      String? phone,
      String? userType,
      String? userToken,
      String? profileImage}) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
