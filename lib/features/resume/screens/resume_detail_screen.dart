
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:jobhunt/features/resume/models/resume.dart';


class ResumeDetailScreen extends StatefulWidget {
 
  const ResumeDetailScreen({super.key,});

  @override
  State<ResumeDetailScreen> createState() => _ResumeDetailScreenState();
}

class _ResumeDetailScreenState extends State<ResumeDetailScreen> {
  String? pdfUrl;

  
  @override
  Widget build(BuildContext context) {
        final resume = ModalRoute.of(context)!.settings.arguments as Resume;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Column(
        children: [
          if(resume.fullResumePath.isNotEmpty)...{
            Expanded(child: Container(
              color: Colors.white,
              child: const PDF(
                enableSwipe: true,
                swipeHorizontal: true,
                backgroundColor: Colors.white
              ).cachedFromUrl(resume.fullResumePath),
            ))
          }else...{
              const Center(child: Text("Resume is not found"),)
            }

        ],
      )),
    );
  }
}