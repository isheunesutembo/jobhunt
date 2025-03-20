import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/controller/authcontroller.dart';
import 'package:jobhunt/util/custom_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _usernameController=TextEditingController();
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
      automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,children: [
   const Center(child: Text("Welcome,Register",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),)),
   const SizedBox(height: 20,),
        Form(key: _formKey,child: Column(children: [
           Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:CustomTextField(controller:_emailController,hintText: "Enter Your Email:",)
                    ),
                    const SizedBox(height: 15,),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:CustomTextField(controller:_usernameController,hintText: "Enter Your Username:",)
                    ),
                    const SizedBox(height: 15,),
                  
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:CustomTextField(controller:_passwordController,hintText: "Enter Your Password",)
                    ),
                  
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () async{
                              ref.read(authControllerProvider.notifier)
                              .registerWithEmailPassword(_emailController.text, _usernameController.text, _passwordController.text, context);
                              
                            },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )),
                            child: const Text("Register",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                          )),
                     ),
                          const SizedBox(height: 15,),
                    GestureDetector(
                        onTap: () {
                         Navigator.pushNamed(context, '/');
                        },
                        child:const Center(
                          child: Text(
                              "Already have an account ? SignIn",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        )),
        ],))
       

      ],),
    ),
    );
  }
}