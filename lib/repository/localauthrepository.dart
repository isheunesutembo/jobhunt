import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final secureStorageProvider=Provider((ref)=>LocalAuthRepository());
class LocalAuthRepository{

  static final storage=const  FlutterSecureStorage();
  
  
  static  Future<String?> isLoggedIn()async{
    return await storage.read(key: "userToken");

  }
  static void storeToken(String accessToken)async{
    await storage.write(key: "userToken", value: accessToken);
    
  }
  static Future<void>logOut(BuildContext context)async{
    await storage.delete(key: "userToken");
    
    Navigator.pushNamed(context, "/login");

  }
}