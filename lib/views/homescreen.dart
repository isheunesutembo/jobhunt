import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobhunt/widgets/jobcategorieswidget.dart';
import 'package:jobhunt/widgets/search_field_widget.dart';
import 'package:jobhunt/widgets/vacancies_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            //JobCategoriesWidget(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchFieldWidget(),
                  Icon(Icons.tune,color:Colors.black)
                ],
              ),
            ),
          VacanciesList()
          ],),
        ),
      ),
    );
  }
}