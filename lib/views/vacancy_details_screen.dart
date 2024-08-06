import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/controllers/vacancycontroller.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/views/loader.dart';
import 'package:jobhunt/widgets/vacancy_tags.dart';
import 'package:jobhunt/widgets/vacancy_tags_list.dart';

class VacancyDetailsScreen extends ConsumerWidget {
  String vacancyId;
   VacancyDetailsScreen({super.key,required this.vacancyId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final vacancyDetails=ref.watch(getVacancyById(vacancyId));
    return vacancyDetails.when(data: (data){
     return Scaffold(
      appBar: AppBar(elevation: 1,backgroundColor: Colors.white,
      actions:const [
         Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.share),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.favorite),
        )
      ],),
      body: SafeArea(child: SingleChildScrollView(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text(data.title.toString(),style:const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w800),),
     ),
     const SizedBox(height: 10,),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text("\$${data.salary.toString()}",style:const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),
     ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text(data.experience.toString(),style:const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),
     ),
     const SizedBox(height: 10,),
     
    
      Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text(data.description.toString(),style:const TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w500),),
     ),
    VacancyTagsList(vacancy: data)

    ],),)),
     );
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}