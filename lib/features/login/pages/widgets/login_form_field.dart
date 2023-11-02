import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool obsecureText;
  final void Function(String text)? onChanged;

  const LoginFormField({
    super.key,
    required this.hint,
    this.controller,
    this.obsecureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
