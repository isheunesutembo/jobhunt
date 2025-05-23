import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/favorite/controller/favouritecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_tags_list.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/company_profile_widget.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/send_application_button.dart';

import '../../vacancy/models/vacancy.dart';

class FavouriteItemWidget extends ConsumerWidget {
  Vacancy vacancy;
  FavouriteItemWidget({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addToFavorites = ref.watch(favouriteControllerProvider.notifier);
    final userId = ref.watch(localAuthRepositoryProvider).getUserId();

    return Card(
      color: Colors.white,
      elevation: 5,
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    vacancy.title.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$${vacancy.salary}",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Padding(
              padding: const EdgeInsets.all(8.0),
              child: VacancyTagsList(vacancy: vacancy),
            ),
               
              ],
            ),
            Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      addToFavorites.removeFavourite(vacancy.vacancyId!, context);
                    },
                    child: const Icon(Icons.delete)))
          ],
        ),
      ),
    );
  }
}
