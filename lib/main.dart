import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/resume/screens/add_resume_screen.dart';
import 'package:jobhunt/features/vacancyapplication/screens/application_confirmation_screen.dart';
import 'package:jobhunt/features/favorite/screens/favouritescreen.dart';
import 'package:jobhunt/features/auth/screens/log_in_screen.dart';
import 'package:jobhunt/features/main/screens/main_screen.dart';
import 'package:jobhunt/features/profile/screens/profile_screen.dart';
import 'package:jobhunt/features/auth/screens/register_screen.dart';
import 'package:jobhunt/features/resume/screens/resume_detail_screen.dart';
import 'package:jobhunt/features/resume/screens/resume_screen.dart';


Widget _defaultHome=const SignInScreen();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final container=ProviderContainer();
  await container.read(localAuthRepositoryProvider).init();
  final result= container.read(localAuthRepositoryProvider).getUserToken();
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
        '/favoritescreen':(context)=>const FavouriteScreen(),
        '/resumescreen':(context)=>const ResumeScreen(),
        '/addresumescreen':(context)=>const AddResumeScreen(),
        '/resumedetailscreen':(context)=>const ResumeDetailScreen(),
        '/applicationconfirmationscreen':(context)=>const ApplicationConfirmationScreen()

      },
      
    );
  }
}



