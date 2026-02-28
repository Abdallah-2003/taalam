import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_action.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_footer.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_form.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_header.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              RegisterHeader(),
              SizedBox(height: 40),
              RegisterForm(),
              SizedBox(height: 100),
              RegisterAction(),
              SizedBox(height: 40),
              RegisterFooter(),
            ],
          ),
        ),
      ),
    );
  }
}









