import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/resume/models/resume.dart';
import 'package:jobhunt/features/vacancyapplication/controller/application_controller.dart';
import 'package:jobhunt/features/vacancy/models/vacancy.dart';

import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/resume/widgets/resume_widget.dart';

class SendApplicationScreen extends ConsumerStatefulWidget {
  final Vacancy vacancy;
  final Resume resume;
  const SendApplicationScreen(
      {super.key, required this.vacancy, required this.resume});

  @override
  ConsumerState<SendApplicationScreen> createState() =>
      _SendApplicationScreenState();
}

class _SendApplicationScreenState extends ConsumerState<SendApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(localAuthRepositoryProvider).getUserId();
    final application = ref.watch(applicationControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Send Application",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "You Resume",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              ResumeWidget(resume: widget.resume),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        application.sendApplication(
                            widget.vacancy.vacancyId.toString(),
                            widget.resume.id.toString(),
                            widget.vacancy.company!.companyId.toString(),
                            userId!,
                            context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: const Text("Send Application")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
