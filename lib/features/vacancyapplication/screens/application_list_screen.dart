import 'package:flutter/material.dart';
import 'package:jobhunt/features/vacancyapplication/models/application_model.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/application_item_widget.dart';

class ApplicationListScreen extends StatelessWidget {
  final List<ApplicationModel> applications;
   ApplicationListScreen(this.applications);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              itemCount:applications.length,
              itemBuilder: (context, index) {
                
                return  ApplicationItemWidget(applicationModel: applications[index]);
              });
  }
}