

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/controllers/jobcategorycontroller.dart';
import 'package:jobhunt/models/category.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/views/loader.dart';

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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: Colors.white,radius: 40,child: Image.network(categories.fullImagePath!,height: 40,width: 40,)),
            Text(categories.title!,style:const  TextStyle(fontSize: 12,fontWeight: FontWeight.w500 ),)
          
          ],),
        );


      }),
    );

    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}