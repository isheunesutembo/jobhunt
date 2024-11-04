import 'package:flutter/material.dart';
import 'package:jobhunt/widgets/favourites_list.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Favourites",
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FavouritesList()
          ],
        ),
      )),
    );
  }
}
