

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/jobcategory/controllers/jobcategorycontroller.dart';
import 'package:jobhunt/features/jobcategory/models/category.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/vacancy/screens/vacancy_by_category_screen.dart';

class JobCategoriesWidget extends ConsumerWidget {
  const JobCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final jobcategories=ref.watch(getJobCategoriesProvider);
    return jobcategories.when(data: (data){

     return  SizedBox(
      height: 120,
      child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount:data.length ,itemBuilder: (context,index){
        var categories=data[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VacanciesByCategoryScreen(),settings: RouteSettings(arguments: categories)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: Colors.black,radius: 40,child: Image.network(categories.fullImagePath!,height: 40,width: 40,)),
              Text(categories.title!,style:const  TextStyle(fontSize: 12,fontWeight: FontWeight.w500 ),)
            
            ],),
          ),
        );


      }),
    );

    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}