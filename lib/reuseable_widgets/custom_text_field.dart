import 'package:flutter/material.dart';
class CustomTextfield extends StatelessWidget {
  final String title;
  const CustomTextfield({
    super.key, required this.title, required String? Function(String? value) validator, required bool isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: true,
    );
  }
}