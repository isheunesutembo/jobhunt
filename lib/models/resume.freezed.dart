// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resume _$ResumeFromJson(Map<String, dynamic> json) {
  return _Resume.fromJson(json);
}

/// @nodoc
mixin _$Resume {
  String? get userId => throw _privateConstructorUsedError;
  String? get resume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResumeCopyWith<Resume> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeCopyWith<$Res> {
  factory $ResumeCopyWith(Resume value, $Res Function(Resume) then) =
      _$ResumeCopyWithImpl<$Res, Resume>;
  @useResult
  $Res call({String? userId, String? resume});
}

/// @nodoc
class _$ResumeCopyWithImpl<$Res, $Val extends Resume>
    implements $ResumeCopyWith<$Res> {
  _$ResumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? resume = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$ResumeImplCopyWith<$Res> implements $ResumeCopyWith<$Res> {
  factory _$$ResumeImplCopyWith(
          _$ResumeImpl value, $Res Function(_$ResumeImpl) then) =
      __$$ResumeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? resume});
}

/// @nodoc
class __$$ResumeImplCopyWithImpl<$Res>
    extends _$ResumeCopyWithImpl<$Res, _$ResumeImpl>
    implements _$$ResumeImplCopyWith<$Res> {
  __$$ResumeImplCopyWithImpl(
      _$ResumeImpl _value, $Res Function(_$ResumeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? resume = freezed,
  }) {
    return _then(_$ResumeImpl(
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
@JsonSerializable()
class _$ResumeImpl implements _Resume {
  _$ResumeImpl({this.userId, this.resume});

  factory _$ResumeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? resume;

  @override
  String toString() {
    return 'Resume(userId: $userId, resume: $resume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.resume, resume) || other.resume == resume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, resume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeImplCopyWith<_$ResumeImpl> get copyWith =>
      __$$ResumeImplCopyWithImpl<_$ResumeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeImplToJson(
      this,
    );
  }
}

abstract class _Resume implements Resume {
  factory _Resume({final String? userId, final String? resume}) = _$ResumeImpl;

  factory _Resume.fromJson(Map<String, dynamic> json) = _$ResumeImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get resume;
  @override
  @JsonKey(ignore: true)
  _$$ResumeImplCopyWith<_$ResumeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}