

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/controllers/jobcategorycontroller.dart';
import 'package:jobhunt/models/jobcategory.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/views/loader.dart';

class JobCategoriesWidget extends ConsumerWidget {
  const JobCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final jobcategories=ref.watch(getJobCategoriesProvider);
    return jobcategories.when(data: (data){

     return  SizedBox(
      height: 100,
      child: ListView.builder(scrollDirection: Axis.vertical,itemCount:data.length ,itemBuilder: (context,index){
        var categories=data[index];
        return Column(children: [
          Image.network(categories.image!.toString()),
         
          Text(categories.title!,style:const  TextStyle(fontSize: 18,fontWeight: FontWeight.w500 ),)

        ],);


      }),
    );

    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}