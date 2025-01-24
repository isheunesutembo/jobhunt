import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAuthRepositoryProvider = Provider((ref) =>LocalAuthRepository());

class LocalAuthRepository {
 late SharedPreferences _sharedPreferences;
  Future<void>init()async{
    _sharedPreferences=await SharedPreferences.getInstance();
  }
  void setToken(String? token){
    if(token !=null){
      _sharedPreferences.setString("userToken", token);
    }
  }
  void setUserId(String? userId){
    if(userId !=null){
      _sharedPreferences.setString("userId", userId);
    }
  }
  String? getUserToken(){
    return _sharedPreferences.getString("userToken");
  }

 String? getUserId(){
    return _sharedPreferences.getString("userId");
  }

 

  Future<void> logOut(BuildContext context) async {
    _sharedPreferences.clear();

    Navigator.pushNamed(context, "/signinscreen");
  }
}
