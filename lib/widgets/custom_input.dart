import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.label, required this.hide});
  final String label;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          obscureText: hide,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
