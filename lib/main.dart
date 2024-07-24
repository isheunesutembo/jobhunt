import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/repository/localauthrepository.dart';
import 'package:jobhunt/views/homescreen.dart';
import 'package:jobhunt/views/log_in_screen.dart';
import 'package:jobhunt/views/register_screen.dart';



final GlobalKey<NavigatorState>navigatorKey=GlobalKey<NavigatorState>();


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
 
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(
        fontFamily: 'Metropolis',
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(StadiumBorder()),
                elevation: MaterialStateProperty.all(0))),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
          ),
        ),),
 
      routes: {
        '/':(context) => SignInScreen(),
        '/signInScreen':(context) =>const SignInScreen(),
        '/registerscreen':(context) =>const RegisterScreen(),

      },
      
    );
  }
}



