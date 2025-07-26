import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' ;
import 'package:jobhunt/features/vacancyapplication/models/application_model.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/vacancy_application_widget.dart';

class ApplicationItemWidget extends ConsumerWidget {
  ApplicationModel applicationModel;
   ApplicationItemWidget({super.key,required this.applicationModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,children: [
           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Application Status:${applicationModel.status}",
                 style: const TextStyle(color: Colors.black,fontSize: 15,
                 fontWeight: FontWeight.bold),),
               ),
              
             ],
           ),
       VacancyApplicationWidget( vacancyId: applicationModel.vacancyId!,),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(applicationModel.company!.name.toString(),
            style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
          )
          ],),
        ),
      ),
    );
  }
}