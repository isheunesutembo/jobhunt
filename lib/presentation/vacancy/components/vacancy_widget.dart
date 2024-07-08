import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/presentation/home/viewmodel/homeviewmodel.dart';
import 'package:jobhunt/presentation/util/errortext.dart';
import 'package:jobhunt/presentation/util/loader.dart';

class VacancyWidget extends ConsumerWidget {
 
   VacancyWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ref.watch(getVacanciesProvider).when(data: (data){
     return  ListView.builder(itemCount: data.length,itemBuilder: (context,index){
      final vacancy=data[index];
    return   GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/vacancydetailsscreen",arguments: vacancy);
      },
      child: Card(
        child: Container(
          height: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,children: [
      
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(vacancy.title,overflow: TextOverflow.ellipsis,style:const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                 const Text("Salary From:",style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                Text("\$${vacancy.salary}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)
              ],),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(vacancy.description,overflow: TextOverflow.ellipsis,style:const  TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w300),),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(vacancy.experience,style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
            ),
            const SizedBox(height: 15,),
            Center(child: SizedBox(width: 300,height: 50,child: ElevatedButton(onPressed: (){}, child:const Text("Apply",style: TextStyle(color: Colors.white),))))
      
      
          ],),
        ),
      ),
    );
    });
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading:()=>const Loader());
  }
}