
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/vacancy/controllers/vacancycontroller.dart';
import 'package:jobhunt/util/custom_circle_icon_widget.dart';

import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/vacancy/screens/vacancy_details_screen.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_item.dart';

import '../../jobcategory/models/category.dart';

class VacanciesByCategoryScreen extends ConsumerWidget {
  const  VacanciesByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final category = ModalRoute.of(context)!.settings.arguments as Category;
    final vacancies = ref.watch(getVacancyBycategoryProvider(category.categoryId.toString()));
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title.toString()
        ,style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
       
        
      ),
      body: vacancies.when(
          data: (data) {
            return data.isNotEmpty?ListView.builder(
                scrollDirection: Axis.vertical,
                physics:const BouncingScrollPhysics(),
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
                }): Center(
              child: Text("No vacancies found in ${category.title.toString()}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),));
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
