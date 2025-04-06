import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/chat/screens/chat_screen.dart';
import 'package:jobhunt/features/favorite/screens/favouritescreen.dart';
import 'package:jobhunt/features/home/screens/homescreen.dart';
import 'package:jobhunt/features/profile/screens/profile_screen.dart';
import 'package:jobhunt/features/settings/screens/settings_screen.dart';

import 'package:jobhunt/features/vacancyapplication/screens/applications_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int selectedIndex=0;
  void _onItemTap(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  List<Widget>pages=[
    const HomeScreen(),
    const ApplicationsScreen(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      bottomNavigationBar:  BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          onTap: _onItemTap,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset("assets/images/home.png",height: 30,width: 30,),
                label: "Jobs"),
                  BottomNavigationBarItem(
                icon: Image.asset("assets/images/suitcase.png",height: 30,width: 30,),
                label: "Applications"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/heart.png",height: 30,width: 30,
                ),
                label: "Favourites"),
                 BottomNavigationBarItem(
                icon: Image.asset("assets/images/settings.png",height: 30,width: 30,),
                label: "Settings"),
           
         
          ],
        ),
        body: pages[selectedIndex]);
    
  }
}