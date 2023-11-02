
import 'package:flutter/material.dart';

class EmployeeSearchField extends StatelessWidget {
  final void Function(String text)? onChanged;
  final String? hintText;

  const EmployeeSearchField({
    super.key,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
