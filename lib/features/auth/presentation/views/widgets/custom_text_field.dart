import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key, 
    required this.hint, 
    required this.icon, 
    this.isPassword = false,  this.controller, this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.whiteColor, size: 20),
        hintText: hint,
        hintStyle: AppTextStyles.style14,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryPurple, width: 2),
        ),
      ),
    );
  }
}

