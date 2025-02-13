import 'package:flutter/material.dart';

class ApplicationConfirmationScreen extends StatelessWidget {
  const ApplicationConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/check.png",
            height: 90,
            width: 90,
            fit: BoxFit.fill,),
          ),
         const Text("Application Sent ",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/");
            },
            child: const Text("Browse More Jobs",style: TextStyle(color: Colors.orangeAccent,
            fontSize: 12,fontWeight: FontWeight.w400),),
          )
        ],
      ),
    );
  }
}
