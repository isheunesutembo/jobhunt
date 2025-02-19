import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/vacancyapplication/models/application_model.dart';
import 'package:jobhunt/features/vacancyapplication/repository/application_repository.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/utils.dart';

final applicationControllerProvider=AsyncNotifierProvider<ApplicationContoller,AsyncValue<void>>(ApplicationContoller.new);

final getUserApplications=FutureProvider.family((ref,String userId){
  return ref.watch(applicationControllerProvider.notifier).getUserApplications(userId);
});
class ApplicationContoller extends AsyncNotifier<AsyncValue<void>>{
 late ApplicationRepository _applicationRepository;
 late LocalAuthRepository _localAuthRepository;
 
@override
 AsyncValue<void> build(){
  _applicationRepository=ref.watch(applicationRepositoryProvider);
  _localAuthRepository=ref.watch(localAuthRepositoryProvider);
  
  return  const AsyncValue.data(null);
 }

 Future<void> sendApplication(String vacancyId,String resumeId,String companyId,String userId,BuildContext context)async{
 final user=await _applicationRepository.sendApplication(vacancyId, resumeId, companyId, userId);
  final val= switch(user){
    Left(value:final l)=> showSnackBar(context,l.message),
    Right(value:final r)=>Navigator.pushNamed(context, "/applicationconfirmationscreen")
  };
 }


  
Future<List<ApplicationModel>>getUserApplications(String userId)async{
  final res=await   _applicationRepository.getUserApplications(userId);
   return switch(res){
      Left(value:final l)=> throw l,
      Right(value:final r)=>r
    };
}
 



 
}

