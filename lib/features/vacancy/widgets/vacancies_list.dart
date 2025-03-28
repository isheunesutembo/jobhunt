import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/vacancy/controllers/vacancycontroller.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/vacancy/screens/vacancy_details_screen.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_item.dart';

class VacanciesList extends ConsumerWidget {
  const VacanciesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vacancies = ref.watch(getVacanciesProvider);
    return vacancies.when(
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
                              builder: (context) => const VacancyDetailsScreen(
                                ),settings: RouteSettings(arguments: data[index])));
                    },
                    child: VacancyItemWidget(
                      vacancy: data[index],
                    ));
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
