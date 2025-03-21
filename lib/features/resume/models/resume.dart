import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'resume.freezed.dart';
part 'resume.g.dart';

List<Resume> resumeFromJson(dynamic str) =>
    List<Resume>.from((str).map((e) => Resume.fromJson(e)));

@freezed
abstract class Resume with _$Resume {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Resume({
    @JsonKey(name: "_id") String? id,
    String? title,
    String? userId,
    String? resume,
  }) = _Resume;
  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);
}

extension ResumeExt on Resume {
  String get fullResumePath => AppConfig.fullResumeUrl + resume!;
}
