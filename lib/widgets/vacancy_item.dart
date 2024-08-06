import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobhunt/models/vacancy.dart';

class VacancyItemWidget extends StatelessWidget {
  Vacancy vacancy;
VacancyItemWidget({super.key,required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
    child: SizedBox(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.title.toString(),
            style:const  TextStyle(fontSize: 20,color: Colors.black,
            fontWeight: FontWeight.w700),),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("\$${vacancy.salary}",
            style:const TextStyle(fontSize: 15,color: Colors.black,
            fontWeight: FontWeight.w600),),
          ),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.experience.toString(),
            style:const TextStyle(fontSize: 12,color: Colors.black,
            fontWeight: FontWeight.w600),),
          ),
           const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed: (){
                
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child:const Text("Apply",style: TextStyle(fontSize: 12,color: Colors.white,
                  fontWeight: FontWeight.w600),)),
              ),
            ),
          )
        ],
      
      ),
    ),);
  }
}