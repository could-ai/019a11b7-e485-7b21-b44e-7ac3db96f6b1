import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
