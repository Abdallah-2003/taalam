
import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';

class HeaderIconButton extends StatelessWidget {
  final IconData icon;

  const HeaderIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}