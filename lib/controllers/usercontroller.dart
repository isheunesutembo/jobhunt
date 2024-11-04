

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/models/usermodel.dart';
import 'package:jobhunt/repository/userrepository.dart';

class UserController extends AsyncNotifier<AsyncValue<void>>{
  late UserRepository _userRepository;
 
@override
 AsyncValue<void>build(){
  _userRepository=ref.watch(userRepositoryProvider);
  return const AsyncValue.data(null);
 }
  Future<UserModel>getVacancyById(String id)async{
    final res=await _userRepository.getUserById(id);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }
}