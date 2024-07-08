import 'package:flutter/material.dart';
import 'package:jobhunt/domain/models/vacancymodel.dart';

class SkillsWidget extends StatelessWidget {
  VacancyModel vacancyModel;
   SkillsWidget({super.key,required this.vacancyModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: vacancyModel.skillTags.length,itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionChip(backgroundColor: Colors.blue,label: Text(vacancyModel.skillTags[index],style:const TextStyle(color: Colors.black,fontSize: 18),)),
    );
    });
  }
}