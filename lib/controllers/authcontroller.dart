

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/models/usermodel.dart';
import 'package:jobhunt/providers/currentusernotifier.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/repository/authrepository.dart';
import 'package:jobhunt/repository/localauthrepository.dart';
final authControllerProvider=AsyncNotifierProvider<AuthContoller,UserModel>(AuthContoller.new);
class AuthContoller extends AsyncNotifier<UserModel>{
 late AuthRepository _authRepository;
 late LocalAuthRepository _localAuthRepository;
 late CurrentUserNotifier _currentUserNotifier;
@override
 UserModel build(){
  _authRepository=ref.watch(authRepositoryProvider);
  _localAuthRepository=ref.watch(localAuthRepositoryProvider);
  _currentUserNotifier=ref.watch(currentUserNotifierProvider.notifier);
  return null!;
 }

 Future<void> logInWithEmailPassword(String email,String password,BuildContext context)async{
 final user=await _authRepository.logInWithEmailPassword(email, password);
  final val= switch(user){
    Left(value:final l)=> AlertDialog(
        title: const Text('JobHunt'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
             
              Text(l.message.toString()),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    Right(value:final r)=>AlertDialog(
        title: const Text('JobHunt '),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
             const Text('LogIn Successful!'),
              Text("Welcome ${r.username}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
  };
 }

  Future<void>registerWithEmailPassword(String email,String username,String password,BuildContext context)async{
  final user=await _authRepository.registerWithEmailPassword(email, username, password);

  final val=switch(user){
    Left(value: final l)=>AlertDialog(
        title: const Text('JobHunt'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
             
              Text(l.message.toString()),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      Right(value:final r)=>
      AlertDialog(
        title: const Text('JobHunt'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
             
              const Text('Registeration Successful!'),
              Text("Welcome ${r.username}")
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
  };

 }

 Future<UserModel?>getCurrentUserData()async{
  state= const AsyncValue.loading();
  final userId=_localAuthRepository.readUserId();
  if(userId!= null){
    final res=await _authRepository.getCurrentUserData(userId.toString());
    final val=switch(res){
      Left(value:final l)=>state=AsyncValue.error(l.message, StackTrace.current),
      Right(value:final r)=>_getDataSuccess(r)
    };
    return val.value;
  }
  return null;
 }

 AsyncValue<UserModel>_getDataSuccess(UserModel user){
  _currentUserNotifier.addUser(user);
  return state=AsyncValue.data(user);
 }

}

