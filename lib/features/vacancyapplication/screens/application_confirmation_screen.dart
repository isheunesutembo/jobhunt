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
          Image.asset("assets/images/check.png",
          height: 90,
          width: 90,
          fit: BoxFit.fill,)
        ],
      ),
    );
  }
}
