// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) {
  return _ApplicationModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicationModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  String? get vacancyId => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get resume => throw _privateConstructorUsedError;

  /// Serializes this ApplicationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationModelCopyWith<ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCopyWith<$Res> {
  factory $ApplicationModelCopyWith(
          ApplicationModel value, $Res Function(ApplicationModel) then) =
      _$ApplicationModelCopyWithImpl<$Res, ApplicationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      bool? status,
      String? vacancyId,
      String? company,
      String? userId,
      String? resume});
}

/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res, $Val extends ApplicationModel>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? vacancyId = freezed,
    Object? company = freezed,
    Object? userId = freezed,
    Object? resume = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      vacancyId: freezed == vacancyId
          ? _value.vacancyId
          : vacancyId // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      resume: freezed == resume
          ? _value.resume
          : resume // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationModelImplCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$$ApplicationModelImplCopyWith(_$ApplicationModelImpl value,
          $Res Function(_$ApplicationModelImpl) then) =
      __$$ApplicationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      bool? status,
      String? vacancyId,
      String? company,
      String? userId,
      String? resume});
}

/// @nodoc
class __$$ApplicationModelImplCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res, _$ApplicationModelImpl>
    implements _$$ApplicationModelImplCopyWith<$Res> {
  __$$ApplicationModelImplCopyWithImpl(_$ApplicationModelImpl _value,
      $Res Function(_$ApplicationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? vacancyId = freezed,
    Object? company = freezed,
    Object? userId = freezed,
    Object? resume = freezed,
  }) {
    return _then(_$ApplicationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      vacancyId: freezed == vacancyId
          ? _value.vacancyId
          : vacancyId // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      resume: freezed == resume
          ? _value.resume
          : resume // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$ApplicationModelImpl implements _ApplicationModel {
  _$ApplicationModelImpl(
      {@JsonKey(name: "_id") this.id,
      this.status,
      this.vacancyId,
      this.company,
      this.userId,
      this.resume});

  factory _$ApplicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final bool? status;
  @override
  final String? vacancyId;
  @override
  final String? company;
  @override
  final String? userId;
  @override
  final String? resume;

  @override
  String toString() {
    return 'ApplicationModel(id: $id, status: $status, vacancyId: $vacancyId, company: $company, userId: $userId, resume: $resume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.vacancyId, vacancyId) ||
                other.vacancyId == vacancyId) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.resume, resume) || other.resume == resume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, vacancyId, company, userId, resume);

  /// Create a copy of ApplicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      __$$ApplicationModelImplCopyWithImpl<_$ApplicationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationModelImplToJson(
      this,
    );
  }
}

abstract class _ApplicationModel implements ApplicationModel {
  factory _ApplicationModel(
      {@JsonKey(name: "_id") final String? id,
      final bool? status,
      final String? vacancyId,
      final String? company,
      final String? userId,
      final String? resume}) = _$ApplicationModelImpl;

  factory _ApplicationModel.fromJson(Map<String, dynamic> json) =
      _$ApplicationModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  bool? get status;
  @override
  String? get vacancyId;
  @override
  String? get company;
  @override
  String? get userId;
  @override
  String? get resume;

  /// Create a copy of ApplicationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
