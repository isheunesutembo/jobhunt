import 'package:flutter/material.dart';

class VacancyTags extends StatelessWidget {
  String tag;
   VacancyTags({super.key,required this.tag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chip(label: Text(tag,style:const TextStyle(color: Colors.black),),),
    );
  }
}