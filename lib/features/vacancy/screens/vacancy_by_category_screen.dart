
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
    return vacancies.when(
        data: (data) {
          return data.isNotEmpty?ListView.builder(
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
              }): Scaffold(body: Column(
                children: [
                  const SizedBox(height: 30,),
                    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                GestureDetector(onTap:(){
                  Navigator.pop(context);
                },child: GestureDetector(onTap: (){
                  Navigator.pop(context);
                },child: CustomCircleIconWidget(icon: Image.asset("assets/images/backicon.png")))),
                
              ],),
            ),
                  const Center(child: Text("No vacancies"),),
                ],
              ));
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
