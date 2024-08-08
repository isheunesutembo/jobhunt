import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobhunt/providers/httpprovider.dart';


final localAuthRepositoryProvider=Provider((ref)=>LocalAuthRepository(flutterSecureStorage: ref.watch(secureStorageProvider)));
class LocalAuthRepository{
  FlutterSecureStorage _flutterSecureStorage;
  LocalAuthRepository({required FlutterSecureStorage flutterSecureStorage}):_flutterSecureStorage=flutterSecureStorage;
    Future<String?> isLoggedIn()async{
    return await _flutterSecureStorage.read(key: "userToken");

  }
   void storeToken(String accessToken)async{
    await _flutterSecureStorage.write(key: "userToken", value: accessToken);
    
  }
   void storeUserId(String userId)async{
    await _flutterSecureStorage.write(key: "userId", value: userId);
    
  }

  Future<String?> readUserId()async{
    return await _flutterSecureStorage.read(key: "userId").toString();

  }
  
 Future<void>logOut(BuildContext context)async{
    await _flutterSecureStorage.delete(key: "userToken");
    
    Navigator.pushNamed(context, "/signinscreen");

  }
}