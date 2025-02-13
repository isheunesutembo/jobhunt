import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';

class SendApplicationButton extends ConsumerStatefulWidget {
  const SendApplicationButton({super.key});

  @override
  ConsumerState<SendApplicationButton> createState() => _SendApplicationButtonState();
}

class _SendApplicationButtonState extends ConsumerState<SendApplicationButton> {
   File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','.doc','.docx'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
        final userId = ref.watch(localAuthRepositoryProvider).getUserId();
    return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return   SizedBox(height: 500,
                    width: double.infinity,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Align(
                          alignment: Alignment.topRight,
                           child: GestureDetector(onTap: (){
                             Navigator.pop(context);
                           },child:const Icon(Icons.cancel,color: Colors.black,size: 30,)),
                         ),
                       ),
                       const SizedBox(height: 80,),
                       _selectedFile != null
                      ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Selected file: ${_selectedFile!.path}'),
                        ),
                      )
                      :const Center(
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Text('No file selected'),
                        ),
                      ),
                     const SizedBox(height: 20),
                    _selectedFile!=null?
                    Center(
                        child: ElevatedButton(onPressed:(){
                          
                          
                     
                        }, child:const Text("Send Application")),
                      ):
                      Center(
                        child: ElevatedButton(onPressed:(){
                        _pickFile();
                        }, child:const Text("Pick CV or Resume")),
                      )
                    
                    ],),);
                  });
                
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child:const Text("Apply",style: TextStyle(fontSize: 12,color: Colors.white,
                  fontWeight: FontWeight.w600),)),
              ),
            ),
          );
  }
}