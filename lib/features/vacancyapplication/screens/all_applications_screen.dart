import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/vacancyapplication/controller/application_controller.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/application_item_widget.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';

class AllApplicationsScreen extends ConsumerWidget {
  const AllApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(localAuthRepositoryProvider).getUserId();
    final applications = ref.watch(getUserApplications(userId.toString()));
    return applications.when(
        data: (data) {
          return  ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return  ApplicationItemWidget(applicationModel: data[index]);
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
