import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/controllers/authcontroller.dart';
import 'package:jobhunt/providers/currentusernotifier.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/views/homescreen.dart';
import 'package:jobhunt/views/log_in_screen.dart';
import 'package:jobhunt/views/main_screen.dart';

Widget _defaultHome=SignInScreen();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  
  runApp( const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    return const MaterialApp(
      home: MainScreen()
      
    );
  }
}



