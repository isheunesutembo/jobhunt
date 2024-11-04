// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Favourite _$FavouriteFromJson(Map<String, dynamic> json) {
  return _Favourite.fromJson(json);
}

/// @nodoc
mixin _$Favourite {
  Vacancy? get vacancy => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get favoriteId => throw _privateConstructorUsedError;

  /// Serializes this Favourite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavouriteCopyWith<Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteCopyWith<$Res> {
  factory $FavouriteCopyWith(Favourite value, $Res Function(Favourite) then) =
      _$FavouriteCopyWithImpl<$Res, Favourite>;
  @useResult
  $Res call({Vacancy? vacancy, String? userId, String? favoriteId});

  $VacancyCopyWith<$Res>? get vacancy;
}

/// @nodoc
class _$FavouriteCopyWithImpl<$Res, $Val extends Favourite>
    implements $FavouriteCopyWith<$Res> {
  _$FavouriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancy = freezed,
    Object? userId = freezed,
    Object? favoriteId = freezed,
  }) {
    return _then(_value.copyWith(
      vacancy: freezed == vacancy
          ? _value.vacancy
          : vacancy // ignore: cast_nullable_to_non_nullable
              as Vacancy?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteId: freezed == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VacancyCopyWith<$Res>? get vacancy {
    if (_value.vacancy == null) {
      return null;
    }

    return $VacancyCopyWith<$Res>(_value.vacancy!, (value) {
      return _then(_value.copyWith(vacancy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavouriteImplCopyWith<$Res>
    implements $FavouriteCopyWith<$Res> {
  factory _$$FavouriteImplCopyWith(
          _$FavouriteImpl value, $Res Function(_$FavouriteImpl) then) =
      __$$FavouriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Vacancy? vacancy, String? userId, String? favoriteId});

  @override
  $VacancyCopyWith<$Res>? get vacancy;
}

/// @nodoc
class __$$FavouriteImplCopyWithImpl<$Res>
    extends _$FavouriteCopyWithImpl<$Res, _$FavouriteImpl>
    implements _$$FavouriteImplCopyWith<$Res> {
  __$$FavouriteImplCopyWithImpl(
      _$FavouriteImpl _value, $Res Function(_$FavouriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancy = freezed,
    Object? userId = freezed,
    Object? favoriteId = freezed,
  }) {
    return _then(_$FavouriteImpl(
      vacancy: freezed == vacancy
          ? _value.vacancy
          : vacancy // ignore: cast_nullable_to_non_nullable
              as Vacancy?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteId: freezed == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$FavouriteImpl implements _Favourite {
  _$FavouriteImpl({this.vacancy, this.userId, this.favoriteId});

  factory _$FavouriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteImplFromJson(json);

  @override
  final Vacancy? vacancy;
  @override
  final String? userId;
  @override
  final String? favoriteId;

  @override
  String toString() {
    return 'Favourite(vacancy: $vacancy, userId: $userId, favoriteId: $favoriteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteImpl &&
            (identical(other.vacancy, vacancy) || other.vacancy == vacancy) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.favoriteId, favoriteId) ||
                other.favoriteId == favoriteId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vacancy, userId, favoriteId);

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteImplCopyWith<_$FavouriteImpl> get copyWith =>
      __$$FavouriteImplCopyWithImpl<_$FavouriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteImplToJson(
      this,
    );
  }
}

abstract class _Favourite implements Favourite {
  factory _Favourite(
      {final Vacancy? vacancy,
      final String? userId,
      final String? favoriteId}) = _$FavouriteImpl;

  factory _Favourite.fromJson(Map<String, dynamic> json) =
      _$FavouriteImpl.fromJson;

  @override
  Vacancy? get vacancy;
  @override
  String? get userId;
  @override
  String? get favoriteId;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavouriteImplCopyWith<_$FavouriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
