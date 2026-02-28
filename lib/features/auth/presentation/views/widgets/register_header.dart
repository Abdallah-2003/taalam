import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
          ),
          child: const Icon(AppIcons.groupHeader, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 30),
        const Text(AppStrings.createAccount, style: AppTextStyles.style28),
        const SizedBox(height: 8),
        const Text(AppStrings.subtitle, style: AppTextStyles.style14, textAlign: TextAlign.center),
      ],
    );
  }
}