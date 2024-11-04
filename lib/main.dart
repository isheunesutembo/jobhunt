import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/repository/localauthrepository.dart';
import 'package:jobhunt/views/favouritescreen.dart';
import 'package:jobhunt/views/log_in_screen.dart';
import 'package:jobhunt/views/main_screen.dart';
import 'package:jobhunt/views/profile_screen.dart';
import 'package:jobhunt/views/register_screen.dart';


Widget _defaultHome=const SignInScreen();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final container=ProviderContainer();
  final result=await container.read(localAuthRepositoryProvider).isLoggedIn();
  if(result!=null){
    _defaultHome=const MainScreen();
  }
  
  runApp(UncontrolledProviderScope(container:container,child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> _defaultHome,
        '/mainscreen':(context)=>const MainScreen(),
        '/signinscreen':(context)=>const SignInScreen(),
        '/registerscreen':(context)=>const RegisterScreen(),
        '/profilescreen':(context)=>const ProfileScreen(),
        '/favoritescreen':(context)=>const FavouriteScreen()

      },
      
    );
  }
}



