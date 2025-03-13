

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/auth/models/usermodel.dart';
import 'package:jobhunt/features/profile/repository/user_repository.dart';

import 'package:jobhunt/util/utils.dart';
final userControllerProvider=AsyncNotifierProvider<UserController,AsyncValue<void>>(UserController.new);
final getUserDataProvider=FutureProvider.family((ref,String userId){
  return ref.read(userControllerProvider.notifier).getUserData(userId);
});
class UserController extends AsyncNotifier<AsyncValue<void>>{
  late UserRepository _userRepository;
 
@override
 AsyncValue<void>build(){
  _userRepository=ref.watch(userRepositoryProvider);
  return const AsyncValue.data(null);
 }

 
  Future<UserModel>getUserData(String userId)async{
    final res=await _userRepository.getUserData(userId);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }

  Future<void> updateUserData(
      File profileImage,String username ,String firstname,String lastname,String userId, BuildContext context) async {
    final res = await _userRepository.updateUserData(profileImage,username,firstname,lastname,username);
    final val = switch (res) {
      Right(value: final r) => showSnackBar(context, "upload successful"),
      Left(value: final l) => showSnackBar(context, l.toString())
    };}
}