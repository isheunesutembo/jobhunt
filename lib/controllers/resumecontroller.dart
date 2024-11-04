import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/models/resume.dart';
import 'package:jobhunt/repository/resumerepository.dart';
import 'package:jobhunt/util/utils.dart';
final resumeControllerProvider=AsyncNotifierProvider<ResumeController,AsyncValue<void>>(ResumeController.new);
class ResumeController extends AsyncNotifier <AsyncValue<void>>{
  late ResumeRepository _resumeRepository;
  
  @override
  AsyncValue<void> build(){
     _resumeRepository=ref.watch(resumeRepositoryProvider);
    return const AsyncValue.data(null);
  }
  
  Future<void>uploadResume(File resume ,String userId,BuildContext context)async{
    final res=await _resumeRepository.uploadResume(resume, userId);
    final val= switch(res){
      Right(value:final r)=>showSnackBar(context,"upload successful"),
      Left(value:final l)=>showSnackBar(context,l.toString())
    };
  }
  
}