
import 'package:flutter/material.dart';
import 'package:jobhunt/models/vacancy.dart';
import 'package:jobhunt/widgets/vacancy_tags.dart';

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