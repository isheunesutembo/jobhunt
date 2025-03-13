import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobhunt/features/auth/models/usermodel.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/features/profile/controllers/usercontroller.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  File? image;
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final usernameController=TextEditingController();

  

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 20);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      throw 'Failed to pick image';
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        image = File(res.files.first.path);
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final userId=ref.read(localAuthRepositoryProvider).getUserId();
    final userData=ref.watch(getUserDataProvider(userId.toString()));
    return Scaffold(
      appBar: AppBar(
         title: const Text(
            "Edit My Profile",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
      ),
      body: userData.when(data: (data){
        return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [

            GestureDetector(
              onTap:(){
                selectProfileImage();
              } ,
              child: Center(
                child: image!=null?
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  backgroundImage: FileImage(image!),
                ):Center(
                
                  child:data.profileImage!=null?CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    backgroundImage: NetworkImage(data.fullProfileImagePath),
                  ):const CircleAvatar(backgroundColor: Colors.white,radius: 60,backgroundImage: AssetImage("assets/images/person.png"),)
                )
              ),
            ),

             Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                       
                        controller:firstNameController ,
                        enableSuggestions: true,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          firstNameController.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'firstname:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " firstname cannot be empty";
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                       
                        controller:lastNameController ,
                        enableSuggestions: true,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          lastNameController.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'lastname:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " lastname cannot be empty";
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        
                        controller:firstNameController ,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          firstNameController.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'username:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " username cannot be empty";
                          }
                          return null;
                        }),
                      ),
                    ),

                    Center(
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                        
                        }, child: const Text("Update Profile")),
                      ),
                    )
                  
          ],
        ),
      ));
      }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader())
    );
  }
}
