
import 'package:flutter/material.dart';

import 'package:jobhunt/features/vacancy/widgets/vacancy_tags.dart';

import '../models/vacancy.dart';

class VacancyTagsList extends StatelessWidget {
  Vacancy vacancy;
   VacancyTagsList({super.key,required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount: vacancy.skillTags!.length,itemBuilder: (context,index){
        return VacancyTags(tag: vacancy.skillTags![index]);
      
      }),
    );

  }
}