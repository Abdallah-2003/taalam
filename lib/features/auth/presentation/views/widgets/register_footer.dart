import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Text(
        AppStrings.alreadyHaveAccount,
        style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}