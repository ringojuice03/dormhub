import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  final String hintText;
  final controller;
  final bool obscureText;

  const RegistrationTextField({
    super.key, 
    required this.hintText,
    required this.controller,
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Text(hintText, style: Theme.of(context).textTheme.bodyMedium),
            const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        TextField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFC0C0C0)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintStyle: const TextStyle(color: Color(0xFFC0C0C0)), contentPadding: const EdgeInsets.only(left: 21, top: 40),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}