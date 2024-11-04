// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  String? get companyId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get siteLink => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {String? companyId,
      String? name,
      String? address,
      String? logo,
      String? phoneNumber,
      String? siteLink,
      String? email});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? logo = freezed,
    Object? phoneNumber = freezed,
    Object? siteLink = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      siteLink: freezed == siteLink
          ? _value.siteLink
          : siteLink // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyImplCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$CompanyImplCopyWith(
          _$CompanyImpl value, $Res Function(_$CompanyImpl) then) =
      __$$CompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? companyId,
      String? name,
      String? address,
      String? logo,
      String? phoneNumber,
      String? siteLink,
      String? email});
}

/// @nodoc
class __$$CompanyImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyImpl>
    implements _$$CompanyImplCopyWith<$Res> {
  __$$CompanyImplCopyWithImpl(
      _$CompanyImpl _value, $Res Function(_$CompanyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? logo = freezed,
    Object? phoneNumber = freezed,
    Object? siteLink = freezed,
    Object? email = freezed,
  }) {
    return _then(_$CompanyImpl(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      siteLink: freezed == siteLink
          ? _value.siteLink
          : siteLink // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$CompanyImpl implements _Company {
  _$CompanyImpl(
      {this.companyId,
      this.name,
      this.address,
      this.logo,
      this.phoneNumber,
      this.siteLink,
      this.email});

  factory _$CompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyImplFromJson(json);

  @override
  final String? companyId;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? logo;
  @override
  final String? phoneNumber;
  @override
  final String? siteLink;
  @override
  final String? email;

  @override
  String toString() {
    return 'Company(companyId: $companyId, name: $name, address: $address, logo: $logo, phoneNumber: $phoneNumber, siteLink: $siteLink, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.siteLink, siteLink) ||
                other.siteLink == siteLink) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, companyId, name, address, logo,
      phoneNumber, siteLink, email);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      __$$CompanyImplCopyWithImpl<_$CompanyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyImplToJson(
      this,
    );
  }
}

abstract class _Company implements Company {
  factory _Company(
      {final String? companyId,
      final String? name,
      final String? address,
      final String? logo,
      final String? phoneNumber,
      final String? siteLink,
      final String? email}) = _$CompanyImpl;

  factory _Company.fromJson(Map<String, dynamic> json) = _$CompanyImpl.fromJson;

  @override
  String? get companyId;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get logo;
  @override
  String? get phoneNumber;
  @override
  String? get siteLink;
  @override
  String? get email;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
