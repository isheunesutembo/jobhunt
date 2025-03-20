import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/auth/controller/authcontroller.dart';
import 'package:jobhunt/util/color.dart';
import 'package:jobhunt/util/custom_text_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isAsyncCallProcess = false;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "Welcome,SignIn",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 50,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: _emailController,
                          hintText: "Enter Your Email:",
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                            hintText: "Enter Your Password:",
                            controller: _passwordController)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () async {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .logInWithEmailPassword(_emailController.text,
                                      _passwordController.text, context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registerscreen');
                        },
                        child: const Center(
                          child: Text("Don't have an account ? Register",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
