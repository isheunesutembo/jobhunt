import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/repository/localauthrepository.dart';
import 'package:jobhunt/views/favouritescreen.dart';
import 'package:jobhunt/views/homescreen.dart';
import 'package:jobhunt/views/profile_screen.dart';

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
    const FavouriteScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(elevation: 0,
      backgroundColor: Colors.white,
      actions: [
         GestureDetector(onTap: (){
          ref.read(localAuthRepositoryProvider).logOut(context);
         },child:const Text("LogOut",style: TextStyle(color: Colors.black,fontSize: 15),))
      ],),
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
                  Icons.favorite,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Favourites"),
                 BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Profile"),
           
         
          ],
        ),
        body: pages[selectedIndex]);
    
  }
}