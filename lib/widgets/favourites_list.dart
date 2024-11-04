import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/controllers/favouritecontroller.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/views/loader.dart';
import 'package:jobhunt/views/vacancy_details_screen.dart';
import 'package:jobhunt/widgets/vacancy_item.dart';

class FavouritesList extends ConsumerWidget {
  const FavouritesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(getFavourites("66d9936f606e72003f73a776"));
    return favourites.when(
        data: (data) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VacancyDetailsScreen(
                                  vacancyId:
                                      data[index].vacancy!.vacancyId.toString())));
                                      
                    },
                    child: VacancyItemWidget(
                      vacancy: data[index].vacancy!,
                    ));
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
