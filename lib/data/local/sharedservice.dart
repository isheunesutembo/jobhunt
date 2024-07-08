import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SharedService{
  static final storage=FlutterSecureStorage();

  static Future<String?>isLoggedIn()async{
    return await storage.read(key:"userToken" );
  }
  static void storeToken(String userToken)async{
    await storage.write(key: "userToken", value: userToken);
  }
   static Future<void>logOut(BuildContext context)async{
    await storage.delete(key: "userToken");
    
    Navigator.pushNamed(context, "/signInScreen");

  }
}