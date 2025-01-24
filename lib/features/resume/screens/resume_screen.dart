import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/resume/controllers/resumecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/resume/screens/resume_detail_screen.dart';
import 'package:jobhunt/features/resume/widgets/resume_widget.dart';

class ResumeScreen extends ConsumerWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(localAuthRepositoryProvider).getUserId();
    final resume = ref.watch(getResumesProvider(userId!));
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Resume",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/addresumescreen');
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Add Resume",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            )
          ],
        ),
        body: resume.when(
            data: (data) {
              return SafeArea(
                  child: RefreshIndicator(
                onRefresh: () => ref.refresh(getResumesProvider(userId).future),
                child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final resume = data[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResumeDetailScreen(),
                                        settings:
                                            RouteSettings(arguments: resume)));
                              },
                              child: ResumeWidget(resume: data[index]));
                        })),
              ));
            },
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader()));
  }
}
