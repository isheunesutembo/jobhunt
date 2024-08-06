// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vacancy _$VacancyFromJson(Map<String, dynamic> json) {
  return _Vacancy.fromJson(json);
}

/// @nodoc
mixin _$Vacancy {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get requirements => throw _privateConstructorUsedError;
  List<String>? get skillTags => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get salary => throw _privateConstructorUsedError;
  String? get benefits => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get vacancyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VacancyCopyWith<Vacancy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacancyCopyWith<$Res> {
  factory $VacancyCopyWith(Vacancy value, $Res Function(Vacancy) then) =
      _$VacancyCopyWithImpl<$Res, Vacancy>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? requirements,
      List<String>? skillTags,
      String? experience,
      String? salary,
      String? benefits,
      String? company,
      String? vacancyId});
}

/// @nodoc
class _$VacancyCopyWithImpl<$Res, $Val extends Vacancy>
    implements $VacancyCopyWith<$Res> {
  _$VacancyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? requirements = freezed,
    Object? skillTags = freezed,
    Object? experience = freezed,
    Object? salary = freezed,
    Object? benefits = freezed,
    Object? company = freezed,
    Object? vacancyId = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      requirements: freezed == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String?,
      skillTags: freezed == skillTags
          ? _value.skillTags
          : skillTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String?,
      benefits: freezed == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      vacancyId: freezed == vacancyId
          ? _value.vacancyId
          : vacancyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VacancyImplCopyWith<$Res> implements $VacancyCopyWith<$Res> {
  factory _$$VacancyImplCopyWith(
          _$VacancyImpl value, $Res Function(_$VacancyImpl) then) =
      __$$VacancyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? requirements,
      List<String>? skillTags,
      String? experience,
      String? salary,
      String? benefits,
      String? company,
      String? vacancyId});
}

/// @nodoc
class __$$VacancyImplCopyWithImpl<$Res>
    extends _$VacancyCopyWithImpl<$Res, _$VacancyImpl>
    implements _$$VacancyImplCopyWith<$Res> {
  __$$VacancyImplCopyWithImpl(
      _$VacancyImpl _value, $Res Function(_$VacancyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? requirements = freezed,
    Object? skillTags = freezed,
    Object? experience = freezed,
    Object? salary = freezed,
    Object? benefits = freezed,
    Object? company = freezed,
    Object? vacancyId = freezed,
  }) {
    return _then(_$VacancyImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      requirements: freezed == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String?,
      skillTags: freezed == skillTags
          ? _value._skillTags
          : skillTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String?,
      benefits: freezed == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      vacancyId: freezed == vacancyId
          ? _value.vacancyId
          : vacancyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VacancyImpl implements _Vacancy {
  _$VacancyImpl(
      {this.title,
      this.description,
      this.requirements,
      final List<String>? skillTags,
      this.experience,
      this.salary,
      this.benefits,
      this.company,
      this.vacancyId})
      : _skillTags = skillTags;

  factory _$VacancyImpl.fromJson(Map<String, dynamic> json) =>
      _$$VacancyImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? requirements;
  final List<String>? _skillTags;
  @override
  List<String>? get skillTags {
    final value = _skillTags;
    if (value == null) return null;
    if (_skillTags is EqualUnmodifiableListView) return _skillTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? experience;
  @override
  final String? salary;
  @override
  final String? benefits;
  @override
  final String? company;
  @override
  final String? vacancyId;

  @override
  String toString() {
    return 'Vacancy(title: $title, description: $description, requirements: $requirements, skillTags: $skillTags, experience: $experience, salary: $salary, benefits: $benefits, company: $company, vacancyId: $vacancyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacancyImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            const DeepCollectionEquality()
                .equals(other._skillTags, _skillTags) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.benefits, benefits) ||
                other.benefits == benefits) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.vacancyId, vacancyId) ||
                other.vacancyId == vacancyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      requirements,
      const DeepCollectionEquality().hash(_skillTags),
      experience,
      salary,
      benefits,
      company,
      vacancyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VacancyImplCopyWith<_$VacancyImpl> get copyWith =>
      __$$VacancyImplCopyWithImpl<_$VacancyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VacancyImplToJson(
      this,
    );
  }
}

abstract class _Vacancy implements Vacancy {
  factory _Vacancy(
      {final String? title,
      final String? description,
      final String? requirements,
      final List<String>? skillTags,
      final String? experience,
      final String? salary,
      final String? benefits,
      final String? company,
      final String? vacancyId}) = _$VacancyImpl;

  factory _Vacancy.fromJson(Map<String, dynamic> json) = _$VacancyImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get requirements;
  @override
  List<String>? get skillTags;
  @override
  String? get experience;
  @override
  String? get salary;
  @override
  String? get benefits;
  @override
  String? get company;
  @override
  String? get vacancyId;
  @override
  @JsonKey(ignore: true)
  _$$VacancyImplCopyWith<_$VacancyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
