import 'package:flutter/material.dart';
import 'package:jobhunt/features/vacancyapplication/models/application_model.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepOrangeAccent,
        content: Text(text),
      ),
    );
}

List<ApplicationModel>filterApplications(List<ApplicationModel>applications,String status){
  return applications.where((element) => element.status == status).toList();
}