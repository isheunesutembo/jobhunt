
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/favorite/controller/favouritecontroller.dart';
import 'package:jobhunt/features/resume/controllers/resumecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_tags_list.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/company_profile_widget.dart';


import '../models/vacancy.dart';

class VacancyItemWidget extends ConsumerWidget {
  Vacancy vacancy;
  VacancyItemWidget({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addToFavorites = ref.watch(favouriteControllerProvider.notifier);
    final userId = ref.watch(localAuthRepositoryProvider).getUserId();
    final resume = ref.watch(getResumesProvider(userId!));
    return Card(
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
                      addToFavorites.addToFavourite(
                          vacancy.vacancyId!, userId!, context);
                    },
                    child: const Icon(Icons.favorite)))
          ],
        ),
      ),
    );
  }
}
