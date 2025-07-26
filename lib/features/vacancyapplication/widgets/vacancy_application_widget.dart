import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/vacancy/controllers/vacancycontroller.dart';
import 'package:jobhunt/features/vacancy/models/vacancy.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_tags_list.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';

class VacancyApplicationWidget extends ConsumerWidget {
  Vacancy vacancy;
   VacancyApplicationWidget({super.key,required this.vacancy});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   

      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                vacancy.title.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           
          ],
        ),
      );
    
  }
}