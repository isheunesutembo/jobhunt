import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/controller/authcontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/settings/widgets/settings_item_widget.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId=ref.read(localAuthRepositoryProvider).getUserId();
    final userData=ref.watch(getCurrentUserProvider(userId!));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: userData.when(data: (userdata){
       return Column(
        children: [
          Center(
            child: userdata.profileImage !=null ||userdata.profileImage!.isNotEmpty?
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2
                    ),
                    image: DecorationImage(image:
                    NetworkImage(
                      userdata.profileImage!,
                      
                    ) ,
                    fit: BoxFit.cover
                    )
                  ),
                  
                ),
                   Positioned(
                                              bottom: 5,
                                              right: 0,
                                              child: Card(
                                                elevation: 2,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.white),
                                                  child: Image.asset(
                                                    "assets/icons/cameraicon.png",
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                ),
                                              ))
              ],
            ): Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2
                    ),
                    image: DecorationImage(image:
                    NetworkImage(
                      userdata.profileImage!,
                      
                    ) ,
                    fit: BoxFit.cover
                    )
                  ),
                  
                ),
                   Positioned(
                                              bottom: 5,
                                              right: 0,
                                              child: Card(
                                                elevation: 2,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.white),
                                                  child: Image.asset(
                                                    "assets/images/developer.png",
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                ),
                                              ))
              ],
            ),
          ),
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
          SettingsItemWidget(
              title: "Vacancy Application History", icon: Icons.arrow_right),
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
