import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/favorite/controller/favouritecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/vacancy/screens/vacancy_details_screen.dart';
import 'package:jobhunt/features/favorite/widgets/favourite_item_widget.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_item.dart';

class FavouritesList extends ConsumerWidget {
  const FavouritesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId=ref.read(localAuthRepositoryProvider).getUserId();
    
    final favourites = ref.watch(getFavourites(userId.toString()));
    return favourites.when(
        data: (data) {
          return data.isNotEmpty? ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const VacancyDetailsScreen(),
                              settings: RouteSettings(
                                  arguments: data[index].vacancy!)));
                    },
                    child: FavouriteItemWidget(
                      vacancy: data[index].vacancy!,
                    ));
              }):const Center(child: Text("No favourites"),);
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
