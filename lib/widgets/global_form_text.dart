import 'package:flutter/material.dart';

class GlobalFormText extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;

  const GlobalFormText({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}