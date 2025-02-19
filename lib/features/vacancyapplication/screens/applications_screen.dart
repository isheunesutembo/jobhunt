import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/vacancyapplication/controller/application_controller.dart';
import 'package:jobhunt/features/vacancyapplication/screens/application_list_screen.dart';

import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';

import '../../../util/utils.dart';

class ApplicationsScreen extends ConsumerStatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  ConsumerState<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends ConsumerState<ApplicationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    _tabController = TabController(length: 3, vsync: this);
   
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.read(localAuthRepositoryProvider).getUserId();
    final applications = ref.watch(getUserApplications(userId.toString()));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Job Applications",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(controller: _tabController, tabs: const [
          Text(
            "Pending",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "Accepted",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "Rejected",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ]),
      ),
      body: applications.when(data: (data)=>TabBarView(controller: _tabController,children: [
        ApplicationListScreen(filterApplications(data, "Pending")),
                ApplicationListScreen(filterApplications(data, "Accepted")),
                        ApplicationListScreen(filterApplications(data, "Rejected"))
      ]), error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader()),
    );
  }
}
