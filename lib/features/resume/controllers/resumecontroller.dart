import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/resume/models/resume.dart';

import 'package:jobhunt/features/resume/repository/resumerepository.dart';
import 'package:jobhunt/util/utils.dart';

final resumeControllerProvider =
    AsyncNotifierProvider<ResumeController, List<Resume>>(
        ResumeController.new);
final getResumesProvider=FutureProvider.family<List<Resume>,String>((ref,userId){
final resume=ref.watch(resumeControllerProvider.notifier);
return resume.getResumes(userId);
});


class ResumeController extends AsyncNotifier<List<Resume>> {
  late ResumeRepository _resumeRepository;
  late LocalAuthRepository _localAuthRepository;
  @override
  Future<List<Resume>> build() async{
    _localAuthRepository=ref.watch(localAuthRepositoryProvider);
    _resumeRepository = ref.watch(resumeRepositoryProvider);
    refreshData();
    return   getResumes(_localAuthRepository.getUserId().toString());
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
   Future<void> refreshData() async {
    state = const AsyncValue.loading(); // Set state to loading
    state = await AsyncValue.guard(() async => await  getResumes(_localAuthRepository.getUserId().toString())); // Fetch new data
  }

   Future<void> deleteResume(BuildContext context,String resumeId) async {
    final res = await _resumeRepository.deleteResume(resumeId);
   return switch (res) {
      Left(value: final l) => throw l.message,
      Right(value: final r) => showSnackBar(context, r.toString())
    };
  }
}
