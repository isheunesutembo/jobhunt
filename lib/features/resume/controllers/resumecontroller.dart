import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/resume/models/resume.dart';

import 'package:jobhunt/features/resume/repository/resumerepository.dart';
import 'package:jobhunt/util/utils.dart';

final resumeControllerProvider =
    AsyncNotifierProvider<ResumeController, AsyncValue<void>>(
        ResumeController.new);
final getResumesProvider=FutureProvider.family<List<Resume>,String>((ref,userId){
final resume=ref.watch(resumeControllerProvider.notifier);
return resume.getResumes(userId);
});


class ResumeController extends AsyncNotifier<AsyncValue<void>> {
  late ResumeRepository _resumeRepository;

  @override
  AsyncValue<void> build() {
    _resumeRepository = ref.watch(resumeRepositoryProvider);
    return const AsyncValue.data(null);
  }

  Future<void> uploadResume(
      File resume,String title ,String userId, BuildContext context) async {
    final res = await _resumeRepository.uploadResume(resume,title, userId);
    final val = switch (res) {
      Right(value: final r) => showSnackBar(context, "upload successful"),
      Left(value: final l) => showSnackBar(context, l.toString())
    };
  }

  Future<List<Resume>> getResumes(String userId) async {
    final res = await _resumeRepository.getUserResumes(userId);

    return switch (res) {
      Left(value: final l) => throw l.message,
      Right(value: final r) => r
    };
  }

   Future<void> deleteResume(BuildContext context,String resumeId) async {
    final res = await _resumeRepository.deleteResume(resumeId);
   return switch (res) {
      Left(value: final l) => throw l.message,
      Right(value: final r) => showSnackBar(context, r.toString())
    };
  }
}
