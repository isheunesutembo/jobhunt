import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/repository/localauthrepository.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,children: [
        ElevatedButton(onPressed: (){
          ref.read(localAuthRepositoryProvider).logOut(context);
        }, child: Text("Logout"))
      ],),
    );
  }
}