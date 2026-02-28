import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    super.key, 
    required this.hint, 
    required this.icon, 
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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

