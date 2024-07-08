// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancymodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VacancyModel _$VacancyModelFromJson(Map<String, dynamic> json) {
  return _VacancyModel.fromJson(json);
}

/// @nodoc
mixin _$VacancyModel {
  String get title => throw _privateConstructorUsedError;
  String get vacancyId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get requirements => throw _privateConstructorUsedError;
  List<String> get skillTags => throw _privateConstructorUsedError;
  String get salary => throw _privateConstructorUsedError;
  String get experience => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VacancyModelCopyWith<VacancyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacancyModelCopyWith<$Res> {
  factory $VacancyModelCopyWith(
          VacancyModel value, $Res Function(VacancyModel) then) =
      _$VacancyModelCopyWithImpl<$Res, VacancyModel>;
  @useResult
  $Res call(
      {String title,
      String vacancyId,
      String description,
      String requirements,
      List<String> skillTags,
      String salary,
      String experience,
      String? category,
      String company});
}

/// @nodoc
class _$VacancyModelCopyWithImpl<$Res, $Val extends VacancyModel>
    implements $VacancyModelCopyWith<$Res> {
  _$VacancyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? vacancyId = null,
    Object? description = null,
    Object? requirements = null,
    Object? skillTags = null,
    Object? salary = null,
    Object? experience = null,
    Object? category = freezed,
    Object? company = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      vacancyId: null == vacancyId
          ? _value.vacancyId
          : vacancyId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String,
      skillTags: null == skillTags
          ? _value.skillTags
          : skillTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VacancyModelImplCopyWith<$Res>
    implements $VacancyModelCopyWith<$Res> {
  factory _$$VacancyModelImplCopyWith(
          _$VacancyModelImpl value, $Res Function(_$VacancyModelImpl) then) =
      __$$VacancyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String vacancyId,
      String description,
      String requirements,
      List<String> skillTags,
      String salary,
      String experience,
      String? category,
      String company});
}

/// @nodoc
class __$$VacancyModelImplCopyWithImpl<$Res>
    extends _$VacancyModelCopyWithImpl<$Res, _$VacancyModelImpl>
    implements _$$VacancyModelImplCopyWith<$Res> {
  __$$VacancyModelImplCopyWithImpl(
      _$VacancyModelImpl _value, $Res Function(_$VacancyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? vacancyId = null,
    Object? description = null,
    Object? requirements = null,
    Object? skillTags = null,
    Object? salary = null,
    Object? experience = null,
    Object? category = freezed,
    Object? company = null,
  }) {
    return _then(_$VacancyModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      vacancyId: null == vacancyId
          ? _value.vacancyId
          : vacancyId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String,
      skillTags: null == skillTags
          ? _value._skillTags
          : skillTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VacancyModelImpl with DiagnosticableTreeMixin implements _VacancyModel {
  _$VacancyModelImpl(
      {required this.title,
      required this.vacancyId,
      required this.description,
      required this.requirements,
      required final List<String> skillTags,
      required this.salary,
      required this.experience,
      this.category,
      required this.company})
      : _skillTags = skillTags;

  factory _$VacancyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VacancyModelImplFromJson(json);

  @override
  final String title;
  @override
  final String vacancyId;
  @override
  final String description;
  @override
  final String requirements;
  final List<String> _skillTags;
  @override
  List<String> get skillTags {
    if (_skillTags is EqualUnmodifiableListView) return _skillTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skillTags);
  }

  @override
  final String salary;
  @override
  final String experience;
  @override
  final String? category;
  @override
  final String company;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VacancyModel(title: $title, vacancyId: $vacancyId, description: $description, requirements: $requirements, skillTags: $skillTags, salary: $salary, experience: $experience, category: $category, company: $company)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VacancyModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('vacancyId', vacancyId))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('requirements', requirements))
      ..add(DiagnosticsProperty('skillTags', skillTags))
      ..add(DiagnosticsProperty('salary', salary))
      ..add(DiagnosticsProperty('experience', experience))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('company', company));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacancyModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.vacancyId, vacancyId) ||
                other.vacancyId == vacancyId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            const DeepCollectionEquality()
                .equals(other._skillTags, _skillTags) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      vacancyId,
      description,
      requirements,
      const DeepCollectionEquality().hash(_skillTags),
      salary,
      experience,
      category,
      company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VacancyModelImplCopyWith<_$VacancyModelImpl> get copyWith =>
      __$$VacancyModelImplCopyWithImpl<_$VacancyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VacancyModelImplToJson(
      this,
    );
  }
}

abstract class _VacancyModel implements VacancyModel {
  factory _VacancyModel(
      {required final String title,
      required final String vacancyId,
      required final String description,
      required final String requirements,
      required final List<String> skillTags,
      required final String salary,
      required final String experience,
      final String? category,
      required final String company}) = _$VacancyModelImpl;

  factory _VacancyModel.fromJson(Map<String, dynamic> json) =
      _$VacancyModelImpl.fromJson;

  @override
  String get title;
  @override
  String get vacancyId;
  @override
  String get description;
  @override
  String get requirements;
  @override
  List<String> get skillTags;
  @override
  String get salary;
  @override
  String get experience;
  @override
  String? get category;
  @override
  String get company;
  @override
  @JsonKey(ignore: true)
  _$$VacancyModelImplCopyWith<_$VacancyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
