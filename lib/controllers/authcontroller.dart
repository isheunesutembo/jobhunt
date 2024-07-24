

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/models/usermodel.dart';
import 'package:jobhunt/repository/authrepository.dart';
final authControllerProvider=AsyncNotifierProvider<AuthContoller,AsyncValue<UserModel>>(AuthContoller.new);
class AuthContoller extends AsyncNotifier<AsyncValue<UserModel>>{
 late AuthRepository _authRepository;
@override
 AsyncValue<UserModel> build(){
  _authRepository=ref.watch(authRepositoryProvider);
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

}

