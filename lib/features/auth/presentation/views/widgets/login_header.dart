import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(AppIcons.lockHeader, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 30),
        const Text(AppStrings.welcome, style: AppTextStyles.style28),
        const SizedBox(height: 8),
        const Text(AppStrings.subtitle, style: AppTextStyles.style14),
      ],
    );
  }
}