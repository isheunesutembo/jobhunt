import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/vacancy/controllers/vacancycontroller.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_tags_list.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';

class VacancyApplicationWidget extends ConsumerWidget {
  String vacancyId;
   VacancyApplicationWidget({super.key,required this.vacancyId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final vacancies=ref.watch(getVacancyById(vacancyId));
    return vacancies.when(data: (data){
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.title.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$${data.salary}",
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
           
                  
            const SizedBox(
              height: 10,
            ),
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: VacancyTagsList(vacancy: data),
        ),
           
          ],
        ),
      );
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader());
  }
}