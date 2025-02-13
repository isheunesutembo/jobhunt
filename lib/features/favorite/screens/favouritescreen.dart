import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/favorite/controller/favouritecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/favorite/widgets/favourites_list.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userId=ref.read(localAuthRepositoryProvider).getUserId();
    final favourites = ref.watch(getFavourites(userId.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Favourites",
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
      ),
      body:  SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(getFavourites(userId.toString()).future),
          child: const SingleChildScrollView(
                  child: Column(
          children: [
            FavouritesList()
          ],
                  ),
                ),
        ),
      ),
    );
  }
}
