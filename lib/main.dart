import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/data/local/sharedservice.dart';
import 'package:jobhunt/presentation/authentication/views/log_in_screen.dart';
import 'package:jobhunt/presentation/authentication/views/register_screen.dart';
import 'package:jobhunt/presentation/home/homescreen.dart';
import 'package:jobhunt/presentation/vacancy/vacancy_detail_screen.dart';


final GlobalKey<NavigatorState>navigatorKey=GlobalKey<NavigatorState>();

Widget _defaultHome=const SignInScreen();
bool show=true;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? result=await SharedService.isLoggedIn();
  if(result!=null){
    _defaultHome=HomeScreen();
  }
 
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
        '/':(context) => _defaultHome,
        '/signInScreen':(context) =>const SignInScreen(),
        '/homeScreen':(context) =>const HomeScreen(),
        '/registerscreen':(context) =>const RegisterScreen(),
        '/vacancydetailsscreen':(context) =>const VacancyDetailsScreen()
      },
      
    );
  }
}



