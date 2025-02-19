import 'package:flutter/material.dart';
import 'package:jobhunt/features/vacancyapplication/screens/accepted_applications_screen.dart';
import 'package:jobhunt/features/vacancyapplication/screens/all_applications_screen.dart';
import 'package:jobhunt/features/vacancyapplication/screens/pending_applications_screen.dart';
import 'package:jobhunt/features/vacancyapplication/screens/rejected_applications_screen.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child:Scaffold(
      appBar: AppBar(elevation: 0,
      title: const Text("My Job Applications",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
      bottom: const TabBar(indicatorColor:Colors.black ,
      tabs: [
       Text("All Applications", style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),),
                     Text("Pending", style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),),
                    Text("Accepted", style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),),
                    Text("Rejected", style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),),

      ],),),
      body: const TabBarView(children: [
        AllApplicationsScreen(),
        PendingApplicationsScreen(),
        AcceptedApplicationsScreen(),
        RejectedApplicationsScreen()
      ]),
    ) );
  }
}