import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/views/chat_screen.dart';
import 'package:jobhunt/views/favouritescreen.dart';
import 'package:jobhunt/views/homescreen.dart';
import 'package:jobhunt/views/profile_screen.dart';
import 'package:jobhunt/views/settings_screen.dart';

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
    const ChatScreen(),
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
          onTap: _onItemTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Home"),
                  BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Favourites"),
                 BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Settings"),
           
         
          ],
        ),
        body: pages[selectedIndex]);
    
  }
}