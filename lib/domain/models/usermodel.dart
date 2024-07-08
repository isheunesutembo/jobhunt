import 'package:freezed_annotation/freezed_annotation.dart';
part 'usermodel.freezed.dart';
part 'usermodel.g.dart';
@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
  @JsonKey(name: '_id')required String userId,
  String? username,
  String? email,
  bool? verification,
  String? phone,
  String? userType,
  String? createdAt,
  String? updatedAt,
  int? iV,
  String? userToken,


  
    
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
