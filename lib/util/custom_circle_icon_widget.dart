import 'package:flutter/material.dart';

class CustomCircleIconWidget extends StatelessWidget {
  Widget icon;
  CustomCircleIconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: icon,
    );
  }
}
