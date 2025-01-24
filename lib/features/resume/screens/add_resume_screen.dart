import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/resume/controllers/resumecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';

class AddResumeScreen extends ConsumerStatefulWidget {
  const AddResumeScreen({super.key});

  @override
  ConsumerState<AddResumeScreen> createState() => _AddResumeScreenState();
}

class _AddResumeScreenState extends ConsumerState<AddResumeScreen> {
  @override
  File? _selectedFile;
  String? _title;
  

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     
    final userId=ref.read(localAuthRepositoryProvider).getUserId();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Resume",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            
              child: SizedBox(
       
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _title = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Resume title:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.abc,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty ) {
                            return "Enter resume title";
                          }
                          return null;
                        }),
                      ),
                    ),
                    _selectedFile != null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('Selected file: ${_selectedFile!.path}'),
                            ),
                          )
                        : const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('No file selected'),
                            ),
                          ),
                    _selectedFile != null
                        ? Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(resumeControllerProvider.notifier)
                                      .uploadResume(_selectedFile!,_title.toString()
                                         , userId.toString(), context);
                                },
                                child: const Text("Upload Resume")),
                          )
                        : Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  _pickFile();
                                },
                                child: const Text("Pick CV or Resume")),
                          )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
