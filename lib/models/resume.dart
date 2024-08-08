import'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobhunt/configs/config.dart';
part 'resume.freezed.dart';
part 'resume.g.dart';
List<Resume> resumeFromJson(dynamic str) =>
   List<Resume>.from((str).map((e) => Resume.fromJson(e)));
@freezed
abstract class Resume with _$Resume{
factory Resume
({
    String? userId,
    String? resume,
  })=_Resume;
    factory Resume.fromJson(Map<String,dynamic>json)=> _$ResumeFromJson(json);
}