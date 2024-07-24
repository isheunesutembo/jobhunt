// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobcategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobCategory _$JobCategoryFromJson(Map<String, dynamic> json) {
  return _JobCategory.fromJson(json);
}

/// @nodoc
mixin _$JobCategory {
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobCategoryCopyWith<JobCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCategoryCopyWith<$Res> {
  factory $JobCategoryCopyWith(
          JobCategory value, $Res Function(JobCategory) then) =
      _$JobCategoryCopyWithImpl<$Res, JobCategory>;
  @useResult
  $Res call({String? title, String? image, String? categoryId});
}

/// @nodoc
class _$JobCategoryCopyWithImpl<$Res, $Val extends JobCategory>
    implements $JobCategoryCopyWith<$Res> {
  _$JobCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? image = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobCategoryImplCopyWith<$Res>
    implements $JobCategoryCopyWith<$Res> {
  factory _$$JobCategoryImplCopyWith(
          _$JobCategoryImpl value, $Res Function(_$JobCategoryImpl) then) =
      __$$JobCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? image, String? categoryId});
}

/// @nodoc
class __$$JobCategoryImplCopyWithImpl<$Res>
    extends _$JobCategoryCopyWithImpl<$Res, _$JobCategoryImpl>
    implements _$$JobCategoryImplCopyWith<$Res> {
  __$$JobCategoryImplCopyWithImpl(
      _$JobCategoryImpl _value, $Res Function(_$JobCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? image = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$JobCategoryImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobCategoryImpl implements _JobCategory {
  _$JobCategoryImpl({this.title, this.image, this.categoryId});

  factory _$JobCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobCategoryImplFromJson(json);

  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? categoryId;

  @override
  String toString() {
    return 'JobCategory(title: $title, image: $image, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobCategoryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobCategoryImplCopyWith<_$JobCategoryImpl> get copyWith =>
      __$$JobCategoryImplCopyWithImpl<_$JobCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobCategoryImplToJson(
      this,
    );
  }
}

abstract class _JobCategory implements JobCategory {
  factory _JobCategory(
      {final String? title,
      final String? image,
      final String? categoryId}) = _$JobCategoryImpl;

  factory _JobCategory.fromJson(Map<String, dynamic> json) =
      _$JobCategoryImpl.fromJson;

  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$JobCategoryImplCopyWith<_$JobCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
