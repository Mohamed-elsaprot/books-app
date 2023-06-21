import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.secure = false,
      required this.onChange,
      required this.label,
      this.validateFun,
      this.icon})
      : super(key: key);
  final String label;
  final Function(String) onChange;
  final bool secure;
  final String? Function(String?)? validateFun;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateFun ??
          (data) {
            if (data!.isEmpty) {
              return 'field is required';
            }
            return null;
          },
      onChanged: onChange,
      obscureText: secure,
      decoration: InputDecoration(
          prefixIcon: icon,
          labelText: label,
          labelStyle: const TextStyle( fontSize: 18),
          enabledBorder: borderStyle(Colors.white.withOpacity(.4)),
          focusedBorder: borderStyle(Colors.indigo),
          errorBorder: borderStyle(Colors.red)),
    );
  }

  InputBorder borderStyle(Color c) {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 1.5, color: c));
  }
}
