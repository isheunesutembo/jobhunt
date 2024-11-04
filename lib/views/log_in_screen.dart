import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/controllers/authcontroller.dart';


class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  String _email="";
  String _password="";

   bool isAsyncCallProcess = false;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validateAndSave(){
    final form =_formKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white,
      automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,children: [
        const SizedBox(height: 120,),
        Form(key: _formKey,child: Column(children: [
          Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _email = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'email:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Invalid email address";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(height: 15,),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _password = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'password:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.password,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty ) {
                            return "Invalid  password";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                        onTap: () {
                         Navigator.pushNamed(context, '/registerscreen');
                        },
                        child:const Center(
                          child: Text(
                              "Don't have an account ? Register",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        )),
                     SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async{
                           ref.read(authControllerProvider.notifier)
                             .logInWithEmailPassword(_email, _password, context);
                           
                           
                          },
                          child: const Text("Sign In"),
                        ))
        ],))
       

      ],),
    ),
    );

  }
}