import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labText;
  final TextInputType? keyBoardtype;
  const CustomTextField({
    super.key,
    this.controller,
    this.labText,
    this.keyBoardtype,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyBoardtype,
      controller: controller,
      decoration: InputDecoration(
        labelText: labText,
      ),
    );
  }
}
