// File: lib/features/auth/ui/widgets/auth_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6D6A6A), width: 2),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
