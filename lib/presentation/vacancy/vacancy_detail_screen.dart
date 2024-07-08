
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobhunt/domain/models/vacancymodel.dart';
import 'package:jobhunt/presentation/vacancy/components/skills_widget.dart';

class VacancyDetailsScreen extends StatelessWidget {
  const VacancyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final vacancies=ModalRoute.of(context)!.settings.arguments as VacancyModel;
    return Scaffold(
      appBar: AppBar(elevation: 0,
      actions: const[ Padding(
        padding:  EdgeInsets.all(8.0),
        child: Icon(Icons.favorite_outline),
      ),
      Padding(
        padding:  EdgeInsets.all(8.0),
        child: Icon(Icons.share),
      )],),
      
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancies.title,style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),

          ),
          
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
             const Text("Experience:",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w200),),
              Expanded(child: Text(vacancies.experience,style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w200),))
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancies.description,style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
          ),
         const Padding(
           padding: EdgeInsets.all(8.0),
           child:  Text("Requirements",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(vacancies.requirements,style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
         ),
         const SizedBox(height: 15,),
         SizedBox(height: 50,child: SkillsWidget(vacancyModel: vacancies))

          ],),
      ),
    );
  }
}