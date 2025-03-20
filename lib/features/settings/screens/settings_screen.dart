import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/controller/authcontroller.dart';
import 'package:jobhunt/features/auth/models/usermodel.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/settings/widgets/settings_item_widget.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId=ref.read(localAuthRepositoryProvider).getUserId();
    final userData=ref.watch(getCurrentUserProvider(userId.toString()));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: userData.when(data: (userdata){
       return Column(
        children: [
         
          GestureDetector(onTap: (){
            Navigator.pushNamed(context, "/profilescreen");
          },child: SettingsItemWidget(title: "My Profile", icon: Icons.arrow_right)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/resumescreen");
            },
            child:
                SettingsItemWidget(title: "My Resume", icon: Icons.arrow_right),
          ),
        
          GestureDetector(onTap: (){
            ref.read(localAuthRepositoryProvider)
            .logOut(context);
          },child: SettingsItemWidget(title: "LogOut", icon: Icons.arrow_right)),
        ],
      );

      }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader())
    );
  }
}
