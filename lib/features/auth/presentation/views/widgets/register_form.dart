import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/features/auth/presentation/views/widgets/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(hint: AppStrings.usernameHint, icon: AppIcons.user),
        SizedBox(height: 20),
        CustomTextField(hint: AppStrings.emailId, icon: AppIcons.email),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hint: AppStrings.password, 
                icon: AppIcons.passwordHidden, 
                isPassword: true
              ),
            ),
          ],
        ),
      ],
    );
  }
}