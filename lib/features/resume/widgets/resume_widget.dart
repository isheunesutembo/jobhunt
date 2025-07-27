
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/resume/controllers/resumecontroller.dart';

import '../models/resume.dart';


class ResumeWidget extends ConsumerStatefulWidget {
  Resume resume;
  ResumeWidget({super.key, required this.resume});

  @override
  ConsumerState<ResumeWidget> createState() => _ResumeWidgetState();
}

class _ResumeWidgetState extends ConsumerState<ResumeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: SizedBox(
          height: 113,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/pdficon.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  widget.resume.title??"",
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {
                      ref
                          .read(resumeControllerProvider.notifier)
                          .deleteResume(context, widget.resume.id.toString());
                    },
                    child: Image.asset("assets/images/deleteicon.png",height: 35,width: 35,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
