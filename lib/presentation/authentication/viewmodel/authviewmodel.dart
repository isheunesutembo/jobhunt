  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/data/repository/authrepositoryimpl.dart';
import 'package:jobhunt/domain/models/usermodel.dart';
final authViewModelProvider=AsyncNotifierProvider<AuthViewModel,AsyncValue<UserModel>>(AuthViewModel.new);
class AuthViewModel extends AsyncNotifier<AsyncValue<UserModel>>{
  late AuthRepositoryImp _authRepository;
  @override
  AsyncValue<UserModel> build(){
  _authRepository=ref.watch(authRepositoryImplProvider);
    return null!;
  }


  Future<void>logInUser(String email,String password,BuildContext context)async{
    state=const AsyncValue.loading();
    final res=await _authRepository.logInUser(email, password);
    final AsyncValue<AsyncValue<UserModel>> val;
    if (res case Left(value:final l)) {
      val = state=AsyncValue.error(ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))), StackTrace.current);
    } else if (res case Right(value:final r)) {
      val = state=AsyncValue.data(r);
    }
 
   
  }

   Future<void>registerUser(String email,String username,String password,BuildContext context)async{
    state=const AsyncValue.loading();
    final res=await _authRepository.registerUser(email, username, password);
    final val=switch(res){
    Left(value:final l)=>state=AsyncValue.error(
        l.message, StackTrace.current),
      Right(value:final r)=>state=AsyncValue.data(r)
        
    };
    
  }
  
  




  

  
}