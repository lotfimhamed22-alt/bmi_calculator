import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
    this.prefix,
    this.suffix, {
    super.key,
    required this.controller,
    required this.textAlign,
    this.validator,
    this.onTap,
  });
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      textAlign: textAlign,
      cursorColor: Colors.black,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey[300],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
