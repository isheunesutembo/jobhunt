import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? label;
  TextEditingController controller;
  CustomTextField(
      {super.key, this.hintText, this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hoverColor: Colors.black,
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        hintStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
