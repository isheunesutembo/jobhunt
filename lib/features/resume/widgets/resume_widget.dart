
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
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/pdf.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                widget.resume.title.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              GestureDetector(
                  onTap: () {
                    ref
                        .read(resumeControllerProvider.notifier)
                        .deleteResume(context, widget.resume.id.toString());
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
