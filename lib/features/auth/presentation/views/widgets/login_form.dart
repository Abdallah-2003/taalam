import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(hint: AppStrings.emailId, icon: AppIcons.email),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(
              child: CustomTextField(
                hint: AppStrings.password, 
                icon: AppIcons.passwordHidden, 
                isPassword: true,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(AppStrings.forgetPassword, style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}